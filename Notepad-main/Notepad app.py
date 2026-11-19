from tkinter import *
from tkinter.ttk import *
from tkinter import font,colorchooser,filedialog,messagebox
import os
import tempfile
from datetime import datetime

#Funtionality Part

def change_theme(bg_color,fg_color):
    textarea.config(bg=bg_color,fg=fg_color)

def toolbarFunc():
    if show_toolbar.get()==False:
        tool_bar.pack_forget()
    
    if show_toolbar.get()==True:
        textarea.pack_forget()
        tool_bar.pack(fill=X)
        textarea.pack(fill=BOTH,expand=1)
        
        
def statusbarFunc():
    if show_statusbar.get()==False:
        status_bar.pack_forget()
        
    else:
        status_bar.pack()

def date_time(event=None):
    currentdatetime=datetime.now() #10/29/2024
    formatteddatetiem=currentdatetime.strftime('%d/%m/%y %H:%M:%S')
    textarea.insert(1.0,formatteddatetiem )
    

def find():
    
    #funtionality
    
    def find_words():
        textarea.tag_remove('match',1.0,END)
        start_pos='1.0'
        word=findentryField.get()
        if word:
            while True:
                start_pos=textarea.search(word,start_pos,stopindex=END)
                if not start_pos:
                    break
                end_pos=f'{start_pos}+{len(word)}c'
                textarea.tag_add('match',start_pos,end_pos)
                
                textarea.tag_config('match',foreground='red',background='yellow')
                start_pos=end_pos
    def replace_text():
        word=findentryField.get()
        replaceWord=replaceentryField.get()
        content=textarea.get(1.0,END)
        new_content=content.replace(word,replaceWord)
        textarea.delete(1.0,END)
        textarea.insert(1.0,new_content)
        

    #GUI
    root1=Toplevel()
    
    root1.title('Find')
    root1.geometry('250x160+400+200')
    root1.resizable(0,0)
    
    lableFrame=LabelFrame(root1,text='Find/Replace')
    lableFrame.pack(pady=20)
    
    findLable=Label(lableFrame,text='Find')
    findLable.grid(row=0,column=0,padx=5,pady=5)
    findentryField=Entry(lableFrame)
    findentryField.grid(row=0,column=1,padx=5,pady=5)
    
    replaceLable=Label(lableFrame,text='Replace')
    replaceLable.grid(row=1,column=0,padx=5,pady=5)
    replaceentryField=Entry(lableFrame)
    replaceentryField.grid(row=1,column=1,padx=5,pady=5)
    
    findButton=Button(lableFrame,text='FIND',command=find_words)
    findButton.grid(row=2,column=0,padx=5,pady=5)
    
    replaceButton=Button(lableFrame,text='REPLACE',command=replace_text)
    replaceButton.grid(row=2,column=1,padx=5,pady=5)
    
    def doSomething():
        textarea.tag_remove('match',1.0,END)
        root1.destroy()
    
    root1.protocol('WM_DELETE_WINDOW',doSomething)
    root1.mainloop()
    

def statusBarFunction(event):
    if textarea.edit_modified():
        words=len(textarea.get(0.0,END).split())
        characters=len(textarea.get(0.0,'end-1c').replace(' ','')) #1.0
        status_bar.config(text=f'Characters: {characters} / Words: {words}')
        
    textarea.edit_modified(False)


url=''
def new_file(event=None):
    global url
    url=''
    textarea.delete(0.0,END)
    
def open_file(event=None):
    global url
    url=filedialog.askopenfilename(initialdir=os.getcwd,title="Select File",filetypes=(('Text File','txt'),
                                                                                    ('All File','*.*')))
    if url !='':
        data=open(url,'r')
        textarea.insert(0.0,data.read())
    root.title(os.path.basename(url))
    
def save_file(event=None):
    if url =='':
        save_url=filedialog.asksaveasfile(mode='w',defaultextension='.txt',filetypes=(('Text File','txt'),
                                                                             ('All File','*.*')))
        if save_url is None:
            pass
        else:
            content=textarea.get(0.0,END)
            save_url.write(content)
            save_url.close()
        
    else:
        content=textarea.get(0.0,END)
        file=open(url,'w')
        file.write(content)

def saveas_file(event=None):
    save_url=filedialog.asksaveasfile(mode='w',defaultextension='.txt',filetypes=(('Text File','txt'),
                                                                             ('All File','*.*')))
    content=textarea.get(0.0,END)
    save_url.write(content)
    save_url.close()
    if url !='':
        os.remove(url)

def printout(event=None):
    file=tempfile.mktemp('.txt')
    open(file,'w').write(textarea.get(1.0,END))
    os.startfile(file,'print')


def iexit(event=None):
    if textarea.edit_modified():
        result=messagebox.askyesnocancel('Warning','Do you want to save the file?')
        if result is True:
            if url!='':
                content=textarea.get(0.0,END)
                file=open(url,'w')
                file.write(content)
                root.destroy()
            else:
                content=textarea.get(0.0,END)
                save_url=filedialog.asksaveasfile(mode='w',defaultextension='.txt',filetypes=(('Text File','txt'),
                                                                             ('All File','*.*')))
                save_url.write(content)
                save_url.close()
                root.destroy()
            
        elif result is False:
            root.destroy()
        
        else:
            pass
    else:
        root.destroy()

fontSize=12
fontStyle='Arial'
def font_style(event):
    global fontStyle
    fontStyle=font_families_variable.get()
    textarea.config(font=(fontStyle,fontSize))

def font_size(event):
    global fontSize
    fontSize=size_variable.get()
    textarea.config(font=(fontStyle,fontSize))
    
def bold_text():
    text_property=font.Font(font=textarea['font']).actual()
    if text_property['weight']=='normal':
        textarea.config(font=(fontStyle,fontSize,'bold'))
        
    elif text_property['weight']=='bold':
        textarea.config(font=(fontStyle,fontSize,'normal'))
        
def italic_text():
    text_property=font.Font(font=textarea['font']).actual()
    if text_property['slant']=='roman':
        textarea.config(font=(fontStyle,fontSize,'italic'))
        
    elif text_property['slant']=='italic':
        textarea.config(font=(fontStyle,fontSize,'roman'))

def underling_text():
    text_property=font.Font(font=textarea['font']).actual()
    if text_property['underline']==0:
        textarea.config(font=(fontStyle,fontSize,'underline'))
        
    elif text_property['underline']==1:
        textarea.config(font=(fontStyle,fontSize))        

def color_select():
    color=colorchooser.askcolor()
    textarea.config(fg=color[1])
    
def align_right():
    data=textarea.get(0.0,END)
    textarea.tag_config('right',justify=RIGHT)
    textarea.delete(0.0,END)
    textarea.insert(INSERT,data,'right')
    
def align_left():
    data=textarea.get(0.0,END)
    textarea.tag_config('left',justify=LEFT)
    textarea.delete(0.0,END)
    textarea.insert(INSERT,data,'left')
    
def align_center():
    data=textarea.get(0.0,END)
    textarea.tag_config('center',justify=CENTER)
    textarea.delete(0.0,END)
    textarea.insert(INSERT,data,'center')
    
    

root=Tk()
root.title("Notebook")
root.geometry("1200x620+10+10")
root.resizable(False,False)

#menuber တည်ဆောင်
menuber=Menu(root)
root.config(menu=menuber)

#filemenu section
#filemenu ကို တည်ဆောင်
filemenu=Menu(menuber,tearoff=False)
menuber.add_cascade(label="File",menu=filemenu)

#image-pngထည့်
newImage=PhotoImage(file="new.png")
openImage=PhotoImage(file="open.png")
saveImage=PhotoImage(file="save.png")
save_asImage=PhotoImage(file="save_as.png")
printImage=PhotoImage(file="print.png")
exitImage=PhotoImage(file="exit.png")


filemenu.add_command(label="New",accelerator="Ctrl+N",image=newImage,compound=LEFT,command=new_file)
filemenu.add_command(label="Open",accelerator="Ctrl+O",image=openImage,compound=LEFT,command=open_file)
filemenu.add_command(label="Save",accelerator="Ctrl+S",image=saveImage,compound=LEFT,command=save_file)
filemenu.add_command(label="Save As",accelerator="Ctrl+Alt+S",image=save_asImage,compound=LEFT,command=saveas_file)
filemenu.add_command(label="Print",accelerator="Ctrl+P",image=printImage,compound=LEFT,command=printout)
filemenu.add_separator()
filemenu.add_command(label="Exit",accelerator="Ctrl+Q",image=exitImage,compound=LEFT,command=iexit)


cutImage=PhotoImage(file='cut.png')
copyImage=PhotoImage(file='copy.png')
pasteImage=PhotoImage(file='paste.png')
clearImage=PhotoImage(file='clear_all.png')
findImage=PhotoImage(file='find.png')
selectImage=PhotoImage(file='checked.png')
undoImage=PhotoImage(file='undo.png')
datetimeImage=PhotoImage(file='calender.png')



tool_bar=Label(root)
tool_bar.pack(side=TOP,fill=X)

font_families=font.families()
font_families_variable=StringVar()
fontfamily_Combobox=Combobox(tool_bar,width=30,values=font_families,state='readonly',textvariable=font_families_variable)
fontfamily_Combobox.current(font_families.index('Arial'))
fontfamily_Combobox.grid(row=0,column=0,padx=5)

size_variable=IntVar()
font_size_Combobox=Combobox(tool_bar,width=14,textvariable=size_variable,state='readonly',values=tuple(range(8,101)))
font_size_Combobox.current(4)
font_size_Combobox.grid(row=0,column=1,padx=5)

fontfamily_Combobox.bind("<<ComboboxSelected>>",font_style)
font_size_Combobox.bind("<<ComboboxSelected>>",font_size)

#buttons section
boldImage=PhotoImage(file="bold.png")
boldButton=Button(tool_bar,image=boldImage,command=bold_text)
boldButton.grid(row=0,column=2,padx=5)

ItalicImage=PhotoImage(file="italic.png")
ItalicButton=Button(tool_bar,image=ItalicImage,command=italic_text)
ItalicButton.grid(row=0,column=3,padx=5)

underlineImage=PhotoImage(file="underline.png")
underlineButton=Button(tool_bar,image=underlineImage,command=underling_text)
underlineButton.grid(row=0,column=4,padx=5)

fontcolorImage=PhotoImage(file="font_color.png")
fontcolorButton=Button(tool_bar,image=fontcolorImage,command=color_select)
fontcolorButton.grid(row=0,column=5,padx=5)


leftAlignImage=PhotoImage(file="left.png")
leftAlignButton=Button(tool_bar,image=leftAlignImage,command=align_left)
leftAlignButton.grid(row=0,column=6,padx=5)

rightAlignImage=PhotoImage(file="right.png")
rightAlignButton=Button(tool_bar,image=rightAlignImage,command=align_right)
rightAlignButton.grid(row=0,column=7,padx=5)

centerAlignImage=PhotoImage(file="center.png")
centerAlignButton=Button(tool_bar,image=centerAlignImage,command=align_center)
centerAlignButton.grid(row=0,column=8,padx=5)

scrollbar=Scrollbar(root)
scrollbar.pack(side=RIGHT,fill=Y)
textarea=Text(root,yscrollcommand=scrollbar.set,font=('Arial,12'),undo=True)
textarea.pack(fill=BOTH,expand=TRUE)
scrollbar.config(command=textarea.yview)

status_bar=Label(root,text="Status Bar")
status_bar.pack(side=BOTTOM)

textarea.bind('<<Modified>>',statusBarFunction)

#Editmenu တည်ဆောင်
editmenu=Menu(menuber,tearoff=False)
editmenu.add_command(label='Undo',accelerator='Ctrl+Z',image=undoImage,compound=LEFT,
                      command=lambda: textarea.event_generate('<Control z>'))
editmenu.add_command(label='Cut',accelerator='Ctrl+X',image=cutImage,compound=LEFT,
                      command=lambda: textarea.event_generate('<Control x>'))
editmenu.add_command(label='Copy',accelerator='Ctrl+C',image=copyImage,compound=LEFT,
                     command=lambda: textarea.event_generate('<Control c>'))
editmenu.add_command(label='Paste',accelerator='Ctrl+V',image=pasteImage,compound=LEFT,
                     command=lambda: textarea.event_generate('<Control v>'))
editmenu.add_command(label='Select All',accelerator='Ctrl+A',image=selectImage,compound=LEFT,
                     command=lambda: textarea.event_generate('<Control a>'))
editmenu.add_command(label='Clear',accelerator='Ctrl+Alt+X',image=clearImage,compound=LEFT,
                     command=lambda :textarea.delete(0.0,END))
editmenu.add_command(label='Find',accelerator='Ctrl+F',image=findImage,compound=LEFT,command=find)
editmenu.add_command(label='Time/Date',accelerator='Ctrl+D',image=datetimeImage,compound=LEFT,
                     command=date_time)
menuber.add_cascade(label="Edit",menu=editmenu)

#Viewmenu Section
show_toolbar=BooleanVar()
show_statusbar=BooleanVar()

toolbarImage=PhotoImage(file='tool_bar.png')
statusImage=PhotoImage(file='status_bar.png')

viewmenu=Menu(menuber,tearoff=False)
viewmenu.add_checkbutton(label='Tool Bar',variable=show_toolbar,onvalue=True,offvalue=False,image=toolbarImage,
                         compound=LEFT,command=toolbarFunc)
show_toolbar.set(True)
viewmenu.add_checkbutton(label='Status Bar',variable=show_statusbar,onvalue=True,offvalue=False,image=statusImage,
                         compound=LEFT,command=statusbarFunc)
show_statusbar.set(True)
menuber.add_cascade(label="View",menu=viewmenu)

#themesmenu Section
themesmenu=Menu(menuber,tearoff=False)
menuber.add_cascade(label="Themes",menu=themesmenu)

lightImage=PhotoImage(file="light_default.png")
darkImage=PhotoImage(file="dark.png")
pinkImage=PhotoImage(file="red.png")
monokaiImage=PhotoImage(file="monokai.png")
blueImage=PhotoImage(file="night_blue.png")

theme_choice=StringVar()
themesmenu.add_radiobutton(label="Light Default",image=lightImage,variable=theme_choice,
                           compound=LEFT,command=lambda :change_theme('white','black'))
themesmenu.add_radiobutton(label="Dark",image=darkImage,variable=theme_choice,
                           compound=LEFT,command=lambda :change_theme('gray20','white'))
themesmenu.add_radiobutton(label="Pink",image=pinkImage,variable=theme_choice,
                           compound=LEFT,command=lambda :change_theme('pink','blue'))
themesmenu.add_radiobutton(label="Monokai",image=monokaiImage,variable=theme_choice,
                           compound=LEFT,command=lambda :change_theme('orange','black'))
themesmenu.add_radiobutton(label="Light Blue",image=blueImage,variable=theme_choice,
                           compound=LEFT,command=lambda :change_theme('light blue','black'))

root.bind("<Control-o>",open_file)
root.bind("<Control-n>",new_file)
root.bind("<Control-s>",save_file)
root.bind("<Control-Alt-s>",saveas_file)
root.bind("<Control-q>",iexit)
root.bind("<Control-p>",printout)
root.bind("<Control-d>",date_time)



root.mainloop()