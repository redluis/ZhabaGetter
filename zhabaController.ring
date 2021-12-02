load "zhabaView.ring"
load "zhabaModel.ring"

import System.GUI

new App {
	StyleFusion()
	openWindow(:zhabaController)
	exec()
}

class zhabaController from windowsControllerParent

	oView = new zhabaView
	oModel = new zhabaModel			

	func set_new_zhaba
		oModel.update()
		oView.zhaba_image {
			pixmap = New qPixMap("img.jpg")
			setPixMap(pixmap.scaled(400, 400, 0, 0))
		}		
