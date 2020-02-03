#include <QtImGui.h>
#include <imgui.h>
#include <QApplication>
#include <QTimer>
#include <QSurfaceFormat>
#include <QOpenGLWidget>
#include <QOpenGLExtraFunctions>
#include <QObject>
#include <QDebug>
#include <imgui_node_editor.h>
#include <memory>

class NodosWidget : public QOpenGLWidget, private QOpenGLExtraFunctions
{
    // CSR - Added this because the doc said it needed to be here or "strange things will happen".
    Q_OBJECT

public:
    // CSR - C++ means you don't inherit your base-class constructors for free.
    // We have to re-declare the baseclass constructor, but that's good because we need
    // to override the default focus policy, since it is set to "don't accept keyboard events".
    NodosWidget(QWidget* parent = nullptr, Qt::WindowFlags f = Qt::WindowFlags()) : QOpenGLWidget(parent, f)
    {
        // CSR - This is needed to get keyboard event out to the event handlers
        setFocusPolicy(Qt::StrongFocus);
    }

    // CSR - we need to store our own font atlas, as ImGui will not copy it when we Build() it.
    std::unique_ptr<ImFontAtlas> nodos_font = std::unique_ptr<ImFontAtlas>(new ImFontAtlas());

protected:
    void initializeGL() override;
    void paintGL() override;


private:
    ImVec4 clear_color = ImColor(114, 144, 154);
};
