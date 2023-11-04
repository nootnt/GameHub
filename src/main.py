# Import the imigra- libraries, yes, libraries
import os
import tkinter as tk
from PIL import ImageTk, Image
import tkvideo

# Define values
bg_color = '#0D0D0D'
bg_color_active = '#0C0C0C'
font_color = '#ffffff'
font_color_active = '#dddddd'
page = 1
max_page = 2

# Define root window
root=tk.Tk()

def game_start(game_index):
    # I know im not supposed to do this, but i dont care
    global page
    # Placeholder
    print("ello lov", game_index, page)

def page_prv():
    # Again, I know im not supposed to do this, but i dont care
    global page
    if(page > 1):
        page = page - 1
    page_state_update()

def page_nxt():
    # Again, I know im not supposed to do this, but i dont care
    global page
    if(page < max_page):
        page = page + 1
    page_state_update()

def whatgameami(buttonnum):
    # Again, i dont care.
    global page
    
    game = "game " + str(buttonnum) + " haha" + str(page)
    return game

# Create root widndow (and lock size an shit ykyk)
root.title("GameHub(tm) application: Game chooser(tm)")
root.geometry('1280x720')
root.resizable(width=False, height=False)
root.iconbitmap('res/icon/icon_s.ico')
root['bg'] = bg_color

# Generate layout frames
logoframe = tk.Frame(root, width=1280, height=128)
logoframe.configure(relief='flat')
logoframe.grid(row=0, column=0, padx=0, pady=0)
logoframe['bg'] = bg_color
gameframe = tk.Frame(root, width=1280, height=600)
gameframe.configure(relief='flat')
gameframe.grid(row=1, column=0, padx=0, pady=0)
gameframe['bg'] = bg_color
selectorfame = tk.Frame(root, width=1280, height=35)
selectorfame.configure(relief='flat')
selectorfame.grid(row=2, column=0, padx=0, pady=0)
selectorfame['bg'] = bg_color

# Drawing the logo
logoimg = ImageTk.PhotoImage(Image.open('res/icon/logo_fullsize.png'))
logo = tk.Label(logoframe, image=logoimg)
logo.configure(bg=bg_color, relief='flat')
logo.pack()

# Generate and place game buttons
btn1=tk.Button(gameframe, width=60, height=13, command=lambda: game_start(1))
btn1.configure(bg=bg_color, fg=font_color, activebackground=bg_color_active, activeforeground=font_color_active, relief='flat')
btn2=tk.Button(gameframe, width=60, height=13, command=lambda: game_start(2))
btn2.configure(bg=bg_color, fg=font_color, activebackground=bg_color_active, activeforeground=font_color_active, relief='flat')
btn3=tk.Button(gameframe, width=60, height=13, command=lambda: game_start(3))
btn3.configure(bg=bg_color, fg=font_color, activebackground=bg_color_active, activeforeground=font_color_active, relief='flat')
btn1.grid(row=0, column=0, padx=60, pady=35)
btn2.grid(row=1, column=0, padx=60, pady=35)
btn3.grid(row=1, column=1, padx=60, pady=35)

# Generate video widget
# Placeholder
#videolabel = tk.Label(gameframe)
#videolabel.grid(row=0, column=1, padx=60, pady=35)
#videoplayer = tkvideo("", videolabel, loop = 1, size = ())
#videoplayer.play()

# ---------- Page mechanism ----------

# Generate and place page buttons
L_pg_btn=tk.Button(selectorfame, text="<", width=3, height=1, command=page_prv)
L_pg_btn.configure(bg=bg_color, fg=font_color, activebackground=bg_color_active, activeforeground=font_color_active, relief='flat')
H_pg_btn=tk.Button(selectorfame, text=">", width=3, height=1, command=page_nxt)
H_pg_btn.configure(bg=bg_color, fg=font_color, activebackground=bg_color_active, activeforeground=font_color_active, relief='flat')
L_pg_btn.grid(row=0, column=0, padx=10, pady=0)
H_pg_btn.grid(row=0, column=2, padx=10, pady=0)

# Generate page inicator label. this is janky, (was) not working and im killing myself.
# Nevermind this I moved this shit cause it wouldnt work so ignore this block of code.
# Still gonna killmyself tho for sure.
# kill yourself NOW!
#pageindicatorstring = str(page) + "/" + str(max_page)
#pg_indicator = tk.Text(selectorfame, width=3, height=1, bg= bg_color, fg=font_color, relief='flat') # << you see this? fuck this fucking shit in particular.
#pg_indicator.insert(tk.END, pageindicatorstring)
#pg_indicator.grid(row=0, column=1, padx=0, pady=0)

# Page logic
def page_state_update():

    btn1.configure(text=whatgameami(1))
    btn2.configure(text=whatgameami(2))
    btn3.configure(text=whatgameami(3))

    # Again, global var, i dont care.
    global page
    if (page == 1):
        L_pg_btn['state'] = "disabled"
        H_pg_btn['state'] = "normal"
    elif(page == max_page):
        H_pg_btn['state'] = "disabled"
        L_pg_btn['state'] = "normal"
    elif(page < 1 or page > max_page):
        print("ya broke something page is out of bounds...\n resetting it back to 1 you dimwit...")
        page = 1
    else:
        H_pg_btn['state'] = "normal"
        L_pg_btn['state'] = "normal"
    
    # Update the page indicator number
    pageindicatorstring = str(page) + "/" + str(max_page)
    pg_indicator = tk.Text(selectorfame, width=3, height=1) # FUCK YOU text widget. I hope you die. Your parrents dont love you.
    pg_indicator.configure(bg= bg_color, fg=font_color, relief='flat')
    pg_indicator.insert(tk.END, pageindicatorstring)
    pg_indicator.grid(row=0, column=1, padx=0, pady=0)

# Initial logic check
page_state_update()

# ---------- End of Page mechanism ----------

# Closing statement, make the entire thing work so dont touch lmao
root.mainloop()
