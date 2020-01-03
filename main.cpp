#include <QtImGui.h>
#include <imgui.h>
#include <QGuiApplication>
#include <QTimer>
#include <QSurfaceFormat>
#include <QOpenGLWindow>
#include <QOpenGLExtraFunctions>
#include <NodosWidget.h>
#include <mainwindow.h>

int main(int argc, char *argv[])
{
    // Use OpenGL 3 Core Profile
    QSurfaceFormat glFormat;
    glFormat.setVersion(3, 3);
    glFormat.setProfile(QSurfaceFormat::CoreProfile);
    QSurfaceFormat::setDefaultFormat(glFormat);

    QApplication a(argc, argv);
    MainWindow m;
    m.show();

    // Get a handle to the qtimgui widget, and have QT update it once every 16ms
    NodosWidget* gw = m.findChild<NodosWidget *>("GraphWidget");
    QTimer timer;
    QObject::connect(&timer, SIGNAL(timeout()), gw, SLOT(update()));
    timer.start(16);

    return a.exec();
}
