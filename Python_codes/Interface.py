import tkinter as tk
from tkinter import filedialog
from tkinter import messagebox

def select_file():
    # Abre a caixa de diálogo para selecionar um arquivo
    

    file_path = filedialog.askopenfilename()
    
    # Verifica se foi selecionado algum arquivo
    if file_path:
        # Abre o arquivo selecionado em modo leitura
        with open(file_path, 'r') as file:
            # Lê o conteúdo do arquivo e salva na variável global
            global file_content
            file_content = file.read()
            # Exibe o conteúdo do arquivo na interface gráfica (opcional)
            text_area.delete('1.0', tk.END)
            text_area.insert(tk.END, file_content)
    else:
        # Caso nao exista o arquivo selecionado eh exibido a menssagem de erro
        messagebox.showerror("ERRO","Nenhum arquivo foi selecionado")
        print("Nenhum arquivo foi selecionado, favor selecionar um arquivo na proxima execucao\n")
# Função para salvar o conteúdo do arquivo em uma variável
def save_content():
    global file_content #Salva o CONTEUDO para edicao posterior 
    print("Conteúdo do arquivo salvo na variável:")
    print(file_content)

# Cria a janela principal
root = tk.Tk()
root.title("Selecionar Arquivo")

# Cria uma área de texto para exibir o conteúdo do arquivo (opcional)
text_area = tk.Text(root, height=10, width=50)
text_area.pack(pady=10)

# Cria um botão para selecionar o arquivo
select_button = tk.Button(root, text="Selecionar Arquivo", command=select_file)
select_button.pack(pady=5)

# Cria um botão para salvar o conteúdo do arquivo na variável
save_button = tk.Button(root, text="Salvar Conteúdo", command=save_content)
save_button.pack(pady=5)

# Inicia o loop principal da interface gráfica
root.mainloop()

