import sys
import pyperclip


def convert_to_markdown(text):
    lines = text.split('\n')
    result = []
    for line in lines:
        if line.strip() == "":
            continue
        indent_level = line.count('\t')
        result.append('  ' * indent_level + '* ' + line.strip())
    return '\n'.join(result)


if __name__ == "__main__":
    input_text = sys.stdin.read()
    markdown_content = convert_to_markdown(input_text)
    pyperclip.copy(markdown_content)
    print("Converted to Markdown and copied to clipboard.")
