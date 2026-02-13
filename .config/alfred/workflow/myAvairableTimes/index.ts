import { load } from "@std/dotenv";
import { join } from "@std/path";

type RequestBody = {
  startDate: string;
  endDate: string;
  dailyStartTime: string;
  dailyEndTime: string;
};

type ResponseBody = {
  result: Availability[];
};

type Availability = {
  lang: "ja" | "en";
  short: string;
  long: string;
};

const homeDir = Deno.env.get("HOME") || Deno.env.get("USERPROFILE") || "";
const envPath = join(homeDir, ".env");

await load({ envPath, export: true });

const endpoint = Deno.env.get("X_MEGRUI_MYCALAVAIRABLE_ENDPOINT");
const apiKey = Deno.env.get("X_MEGURI_API_KEY");

const args = Deno.args;
const lang = args[0] === "en" ? "en" : "ja"; // fallback to ja

// --- JSTの今日 ---
function todayJST() {
  const now = new Date();
  return new Date(now.getTime() + 9 * 60 * 60 * 1000);
}

// --- n日加算 ---
function addDays(d: Date, n: number) {
  const x = new Date(d);
  x.setDate(d.getDate() + n);
  return x;
}

// --- YYYY-MM-DD 形式に ---
function toDateString(d: Date) {
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, "0");
  const day = String(d.getDate()).padStart(2, "0");
  return `${y}-${m}-${day}`;
}

// --- body生成：今日 → 来週日曜 ---
function generateBody(): RequestBody {
  const base = todayJST();
  const dow = base.getDay(); // 0=Sun

  // 今週日曜までの残り日数
  const thisWeekRest = 7 - dow;

  // 来週日曜まで
  const nextWeekEndOffset = thisWeekRest + 7;

  const startDate = toDateString(base);
  const endDate = toDateString(addDays(base, nextWeekEndOffset));

  return {
    startDate,
    endDate,
    dailyStartTime: "11:00",
    dailyEndTime: "15:00",
  };
}

// --- 生成したbodyを使用 ---
const body = generateBody();
// --- Fetch availability from API ---
async function fetchAvailability() {
  if (!endpoint || !apiKey) {
    console.error("API endpoint or key missing.");
    Deno.exit(1);
  }

  const res = await fetch(endpoint, {
    method: "POST",
    headers: {
      "x-megrui-api-key": apiKey,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(body),
  });

  const data: ResponseBody = await res.json();

  return data.result;
}

const availability = await fetchAvailability();

function pickLangResult(
  availability: Availability[],
  lang: Availability["lang"]
) {
  const target = availability.find((item) => item.lang === lang);
  if (!target) {
    console.log(lang === "ja" ? "データがありません。" : "No data found.");
    Deno.exit(0);
  }
  return target;
}

const result = pickLangResult(availability, lang);
console.log(result.short);
