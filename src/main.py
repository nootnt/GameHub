# ---------- init ----------

# Import the imigra- libraries, yes, libraries
import os
import tkinter as tk
from PIL import ImageTk, Image

# Define values
bg_color = "#0D0D0D"
bg_color_active = "#0C0C0C"
font_color = "#ffffff"
font_color_active = "#dddddd"

page = 1


# ---------- The Setup ----------

game_definition = [
    ["Tic tac toe", "Classic Tic Tac Toe known by everyone", "src/ttt.py"],
    ["Hangman", "description", "src/hang.py"],
    ["Sudoku", "description", "src/suku.py"],
    ["Connect 4", "description", "src/c4.py"],
    ["Battleship", "description", "src/ship.py"],
    ["Rock Paper Scisors", "description", "src/rps.py"],
    ["Snake", "description", "src/snek.py"],
    ["Minesweeper", "description", "src/mine.py"],
    ["Dice simulator", "n-sided dice simulator", "src/dice.py"],
]

max_page = int(len(game_definition) / 3) + (len(game_definition) % 3 > 0)

if(len(game_definition) % 3 > 0):
    game_definition.append(["Missing", "There is no game here...", "missing.py"],)
    game_definition.append(["Missing", "There is no game here...", "missing.py"],)

# Define root window
root=tk.Tk()


# ---------- General Functions ----------

def game_func(button_index, runstate):
    # I know im not supposed to do this, but i dont care
    global page

    button_index = ((page - 1) * 3) + button_index
    game = game_definition[button_index - 1]

    if(runstate == False):
        return game
    
    elif(runstate == True):
        exec(open(game[2]).read())

def page_chng(up):
    # Again, I know im not supposed to do this, but i dont care
    global page

    if(up == True):
        if(page < max_page):
            page = page + 1
    elif(up == False):
        if(page > 1):
            page = page - 1
    else:
        print("something went wrong, invalid value in page change function")
    
    page_state_update()


# ---------- General Setup ----------

# Create root widndow (and lock size an shit ykyk)
root.title("GameHub(tm) application: Game chooser(tm)")
root.geometry("1280x720")
root.resizable(width=False, height=False)
root.iconbitmap("res/icon/icon_s.ico")
root["bg"] = bg_color

# Generate layout frames
logoframe = tk.Frame(root, width=1280, height=128)
logoframe.configure(relief="flat")
logoframe.grid(row=0, column=0, padx=0, pady=0)
logoframe["bg"] = bg_color
gameframe = tk.Frame(root, width=1280, height=600)
gameframe.configure(relief="flat")
gameframe.grid(row=1, column=0, padx=0, pady=0)
gameframe["bg"] = bg_color
selectorfame = tk.Frame(root, width=1280, height=35)
selectorfame.configure(relief="flat")
selectorfame.grid(row=2, column=0, padx=0, pady=0)
selectorfame["bg"] = bg_color

# Drawing the logo
logoimg = ImageTk.PhotoImage(Image.open("res/icon/logo_fullsize.png"))
logo = tk.Label(logoframe, image=logoimg)
logo.configure(bg=bg_color, relief="flat")
logo.pack()

# Generate and place game buttons
btn1=tk.Button(gameframe, width=30, height=7, command=lambda: game_func(1, True))
btn1.configure(bg=bg_color, fg=font_color, activebackground=bg_color_active, activeforeground=font_color_active, relief='flat', font=("Calibri", 16))
btn2=tk.Button(gameframe, width=30, height=7, command=lambda: game_func(2, True))
btn2.configure(bg=bg_color, fg=font_color, activebackground=bg_color_active, activeforeground=font_color_active, relief='flat', font=("Calibri", 16))
btn3=tk.Button(gameframe, width=30, height=7, command=lambda: game_func(3, True))
btn3.configure(bg=bg_color, fg=font_color, activebackground=bg_color_active, activeforeground=font_color_active, relief='flat', font=("Calibri", 16))
btn1.grid(row=0, column=0, padx=120, pady=35)
btn2.grid(row=1, column=0, padx=120, pady=35)
btn3.grid(row=1, column=1, padx=120, pady=35)


# ---------- Image mechanism ----------

# PLACEHOLDERRRRRRRRRRRR ASS ASS ASS CUM CUM CUM CUM CUM CUM CUM CUM CUM  CUM CUUUUUM CUM CUM


# ---------- Page mechanism ----------

# Generate and place page buttons
L_pg_btn=tk.Button(selectorfame, text="<", width=3, height=1, command=lambda: page_chng(False))
L_pg_btn.configure(bg=bg_color, fg=font_color, activebackground=bg_color_active, activeforeground=font_color_active, relief="flat", font=("Calibri", 16))
H_pg_btn=tk.Button(selectorfame, text=">", width=3, height=1, command=lambda: page_chng(True))
H_pg_btn.configure(bg=bg_color, fg=font_color, activebackground=bg_color_active, activeforeground=font_color_active, relief="flat", font=("Calibri", 16))
L_pg_btn.grid(row=0, column=0, padx=5, pady=0)
H_pg_btn.grid(row=0, column=2, padx=5, pady=0)

# Page logic
def page_state_update():

    # Recunfigures button labels on page switch
    btn1.configure(text=game_func(1, False)[0] + ":\n\n" + game_func(1, False)[1])
    btn2.configure(text=game_func(2, False)[0] + ":\n\n" + game_func(2, False)[1])
    btn3.configure(text=game_func(3, False)[0] + ":\n\n" + game_func(3, False)[1])

    # Page change logic
    # Again, global var, i dont care.
    global page
    if (page == 1):
        L_pg_btn["state"] = "disabled"
        H_pg_btn["state"] = "normal"
    elif(page == max_page):
        H_pg_btn["state"] = "disabled"
        L_pg_btn["state"] = "normal"
    elif(page < 1 or page > max_page):
        print("ya broke something page is out of bounds...\n resetting it back to 1 you dimwit...")
        page = 1
    else:
        H_pg_btn["state"] = "normal"
        L_pg_btn["state"] = "normal"
    
    # Update the page indicator
    pageindicatorstring = str(page) + "/" + str(max_page)
    pg_indicator = tk.Text(selectorfame, width=3, height=1) # FUCK YOU text widget. I hope you die. Your parrents dont love you.
    pg_indicator.configure(bg= bg_color, fg=font_color, relief="flat", font=("Calibri", 12))
    pg_indicator.insert(tk.END, pageindicatorstring)
    pg_indicator.grid(row=0, column=1, padx=0, pady=0)

# Initial logic check
page_state_update()


# ---------- End ----------

# Closing statement, make the entire thing work so dont touch lmao
root.mainloop()


# ---------- Notes ----------
# button size: 430 x 205
