import re

# Arquivo de entrada e saída
input_file = "items.xml"
output_file = "items_convertido.xml"

# Regex para pegar id="356-367"
pattern = re.compile(r'id="(\d+)-(\d+)"')

with open(input_file, "r", encoding="utf-8") as f:
    content = f.read()

# Função de substituição
def replace_id(match):
    start = match.group(1)
    end = match.group(2)
    return f'fromid="{start}" toid="{end}"'

# Substitui tudo
new_content = pattern.sub(replace_id, content)

# Salva novo arquivo
with open(output_file, "w", encoding="utf-8") as f:
    f.write(new_content)

print("Conversão concluída!")