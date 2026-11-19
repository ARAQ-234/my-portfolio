fontSize=12
fontStyle='Pyidaungsu'
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