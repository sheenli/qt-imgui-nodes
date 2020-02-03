QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    ../external_libraries/imgui-node-editor/Examples/Blueprints/Blueprints.cpp \
    ../external_libraries/imgui-node-editor/Examples/Common/BlueprintUtilities/Source/ax/Builders.cpp \
    ../external_libraries/imgui-node-editor/Examples/Common/BlueprintUtilities/Source/ax/Drawing.cpp \
    ../external_libraries/imgui-node-editor/Examples/Common/BlueprintUtilities/Source/ax/Widgets.cpp \
    ../external_libraries/imgui-node-editor/NodeEditor/Source/crude_json.cpp \
    ../external_libraries/imgui-node-editor/NodeEditor/Source/imgui_canvas.cpp \
    ../external_libraries/imgui-node-editor/NodeEditor/Source/imgui_node_editor.cpp \
    ../external_libraries/imgui-node-editor/NodeEditor/Source/imgui_node_editor_api.cpp \
    ../external_libraries/imgui/imgui.cpp \
    ../external_libraries/imgui/imgui_demo.cpp \
    ../external_libraries/imgui/imgui_draw.cpp \
    ../external_libraries/imgui/imgui_widgets.cpp \
    ../external_libraries/qtimgui/ImGuiRenderer.cpp \
    ../external_libraries/qtimgui/QtImGui.cpp \
    NodosWidget.cpp \
    main.cpp \
    mainwindow.cpp \
    texture_manager.cpp

HEADERS += \
    ../external_libraries/imgui-node-editor/Examples/Common/Application/Include/Application.h \
    ../external_libraries/imgui-node-editor/Examples/Common/BlueprintUtilities/Include/ax/Builders.h \
    ../external_libraries/imgui-node-editor/Examples/Common/BlueprintUtilities/Include/ax/Drawing.h \
    ../external_libraries/imgui-node-editor/Examples/Common/BlueprintUtilities/Include/ax/Math2D.h \
    ../external_libraries/imgui-node-editor/Examples/Common/BlueprintUtilities/Include/ax/Math2D.inl \
    ../external_libraries/imgui-node-editor/Examples/Common/BlueprintUtilities/Include/ax/Widgets.h \
    ../external_libraries/imgui-node-editor/NodeEditor/Include/imgui_node_editor.h \
    ../external_libraries/imgui-node-editor/NodeEditor/Source/crude_json.h \
    ../external_libraries/imgui-node-editor/NodeEditor/Source/imgui_bezier_math.h \
    ../external_libraries/imgui-node-editor/NodeEditor/Source/imgui_bezier_math.inl \
    ../external_libraries/imgui-node-editor/NodeEditor/Source/imgui_canvas.h \
    ../external_libraries/imgui-node-editor/NodeEditor/Source/imgui_extra_math.h \
    ../external_libraries/imgui-node-editor/NodeEditor/Source/imgui_extra_math.inl \
    ../external_libraries/imgui-node-editor/NodeEditor/Source/imgui_node_editor_internal.h \
    ../external_libraries/imgui-node-editor/NodeEditor/Source/imgui_node_editor_internal.inl \
    ../external_libraries/imgui/imgui.h \
    ../external_libraries/qtimgui/ImGuiRenderer.h \
    ../external_libraries/qtimgui/QtImGui.h \
    texture_manager.h \
    NodosWidget.h \
    mainwindow.h

FORMS += \
    mainwindow.ui

INCLUDEPATH += ../external_libraries/imgui/ \
    ../external_libraries/qtimgui/ \
    ../external_libraries/imgui-node-editor/NodeEditor/Include \
    ../external_libraries/imgui-node-editor/Examples/Common/Application/Include \
    ../external_libraries/imgui-node-editor/Examples/Common/BlueprintUtilities/Include \
    ../external_libraries/imgui-node-editor/Examples/Common/BlueprintUtilities/Source


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
