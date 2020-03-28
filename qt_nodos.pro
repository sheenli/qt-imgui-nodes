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
    ../imgui-node-editor/Examples/Blueprints/Blueprints.cpp \
    ../imgui-node-editor/Examples/Common/BlueprintUtilities/Source/ax/Builders.cpp \
    ../imgui-node-editor/Examples/Common/BlueprintUtilities/Source/ax/Drawing.cpp \
    ../imgui-node-editor/Examples/Common/BlueprintUtilities/Source/ax/Widgets.cpp \
    ../imgui-node-editor/NodeEditor/Source/crude_json.cpp \
    ../imgui-node-editor/NodeEditor/Source/imgui_canvas.cpp \
    ../imgui-node-editor/NodeEditor/Source/imgui_node_editor.cpp \
    ../imgui-node-editor/NodeEditor/Source/imgui_node_editor_api.cpp \
    ../imgui-node-editor/ThirdParty/imgui/imgui.cpp \
    ../imgui-node-editor/ThirdParty/imgui/imgui_demo.cpp \
    ../imgui-node-editor/ThirdParty/imgui/imgui_draw.cpp \
    ../imgui-node-editor/ThirdParty/imgui/imgui_widgets.cpp \
    ../qtimgui/ImGuiRenderer.cpp \
    ../qtimgui/QtImGui.cpp \
    NodosWidget.cpp \
    main.cpp \
    mainwindow.cpp \
    texture_manager.cpp

HEADERS += \
    ../imgui-node-editor/Examples/Common/Application/Include/Application.h \
    ../imgui-node-editor/Examples/Common/BlueprintUtilities/Include/ax/Builders.h \
    ../imgui-node-editor/Examples/Common/BlueprintUtilities/Include/ax/Drawing.h \
    ../imgui-node-editor/Examples/Common/BlueprintUtilities/Include/ax/Math2D.h \
    ../imgui-node-editor/Examples/Common/BlueprintUtilities/Include/ax/Math2D.inl \
    ../imgui-node-editor/Examples/Common/BlueprintUtilities/Include/ax/Widgets.h \
    ../imgui-node-editor/NodeEditor/Include/imgui_node_editor.h \
    ../imgui-node-editor/NodeEditor/Source/crude_json.h \
    ../imgui-node-editor/NodeEditor/Source/imgui_bezier_math.h \
    ../imgui-node-editor/NodeEditor/Source/imgui_bezier_math.inl \
    ../imgui-node-editor/NodeEditor/Source/imgui_canvas.h \
    ../imgui-node-editor/NodeEditor/Source/imgui_extra_math.h \
    ../imgui-node-editor/NodeEditor/Source/imgui_extra_math.inl \
    ../imgui-node-editor/NodeEditor/Source/imgui_node_editor_internal.h \
    ../imgui-node-editor/NodeEditor/Source/imgui_node_editor_internal.inl \
    ../imgui-node-editor/ThirdParty/imgui/imgui.h \
    ../qtimgui/ImGuiRenderer.h \
    ../qtimgui/QtImGui.h \
    texture_manager.h \
    NodosWidget.h \
    mainwindow.h

FORMS += \
    mainwindow.ui

INCLUDEPATH += ../imgui-node-editor/ThirdParty/imgui/ \
    ../qtimgui/ \
    ../imgui-node-editor/NodeEditor/Include \
    ../imgui-node-editor/Examples/Common/Application/Include \
    ../imgui-node-editor/Examples/Common/BlueprintUtilities/Include \
    ../imgui-node-editor/Examples/Common/BlueprintUtilities/Source


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
