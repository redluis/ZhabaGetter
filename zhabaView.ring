Load "stdlibcore.ring"
Load "guilib.ring"

import System.GUI

if IsMainSourceFile() { 
	new App {
		StyleFusion()
		new zhabaView { win.show() } 
		exec()
	}
}

class zhabaView from WindowsViewParent
	win = new MainWindow() { 
		move(320,62)
		resize(600,700)
		setWindowTitle("ZhabaGetter")
		setstylesheet("background-color:#242629;") 
		zhaba_image = new label(win) {
			move(95,58)
			resize(400,400)
			setstylesheet("color:black;background-color:;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("Arial")
			setfont(oFont)
			oFont.delete()
			pixmap = New qPixMap("img.jpg")
			setPixMap(pixmap.scaled(400, 400, 0, 0))			
			#setPixMap(New qPixMap("img.jpg"))
			
		}
		zhaba_set = new pushbutton(win) {
			move(200,575)
			resize(200,50)
			setstylesheet("color:white;background-color:;font-size:20px;border:3px solid white;border-radius:15px;font-weight:bold;")
			oFont = new qfont("",0,0,0)
			oFont.fromstring("Arial")
			setfont(oFont)
			oFont.delete()
			setText("new zhaba *-*")
			setClickEvent(Method(:set_new_zhaba))
			
			
		}
	}
