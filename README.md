# qt-imgui-nodes

QT project that glues together these libraries:
1. https://github.com/thedmd/imgui-node-editor
2. https://github.com/crolando/qtimgui

The project uses the IMGUI version from thedmd, which this author reccomends
in order to maximize re-use of the blueprints example. 

## How to use
* Create a folder somewhere on your computer
* Clone this project into a subfolder
* Clone the three above projects into subfolders
* You should have 3 subfolders
* Install MSVS2017 and QT Creator (I use 4.9.1)
* Setup QT Creator to have the QT kits that use VS (I use QT 5.13.0 MSVC2017 64-bit)
* Open the qt_nodos.pro in QT Creator and build.