import sys
import subprocess
from math import ceil



def get_duration(file_path):
    command = ['/opt/homebrew/bin/ffprobe', '-v', 'error', '-show_entries', 'format=duration', '-of', 'default=noprint_wrappers=1:nokey=1', file_path]
    result = subprocess.run(command, stdout=subprocess.PIPE, text=True)
    duration = float(result.stdout.strip())
    return duration

def split_audio(file_path, duration):
    # 分割するファイルの情報を取得
    command = ['/opt/homebrew/bin/ffmpeg', '-i', file_path, '-f', 'null', '-']
    result = subprocess.run(command, stderr=subprocess.PIPE, text=True)
    lines = result.stderr.split('\n')
    total_duration = get_duration(file_path)

    num_splits = ceil(total_duration / duration)
    for i in range(num_splits):
        start_time = i * duration
        output_file = f"{file_path.rsplit('.', 1)[0]}-{i + 1}.{file_path.split('.')[-1]}"
        command = ['/opt/homebrew/bin/ffmpeg', '-i', file_path, '-ss', str(start_time), '-t', str(duration), output_file]
        if i == num_splits - 1:  # 最後の分割では-tオプションを省略
            command = command[:-2]
        subprocess.run(command)

if __name__ == "__main__":
    file_paths = sys.argv[1:-1]
    duration = int(sys.argv[-1])
    print(file_paths)
    for file_path in file_paths:
        split_audio(file_path, duration)

