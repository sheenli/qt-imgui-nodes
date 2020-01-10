#include <NodosWidget.h>

void NodosWidget::initializeGL()
{
    initializeOpenGLFunctions();
    QtImGui::initialize(this);
}

void NodosWidget::paintGL()
{
    QtImGui::newFrame();

    // Do render before ImGui UI is rendered
    glViewport(0, 0, width(), height());
    glClearColor(clear_color.x, clear_color.y, clear_color.z, clear_color.w);
    glClear(GL_COLOR_BUFFER_BIT);

    // Call the node editor frame to bake that shit into the screen.
    NodeEditor_Frame();

    // Have imGUI take the stuff we've specified elsewhere and render it.
    ImGui::Render();
}

void NodosWidget::NodeEditor_Frame()
{
    auto& io = ImGui::GetIO();

    ImGui::Text("FPS: %.2f (%.2gms)", io.Framerate, io.Framerate ? 1000.0f / io.Framerate : 0.0f);

    ImGui::Separator();

    ed::SetCurrentEditor(g_Context);
    ed::Begin("My Editor", ImVec2(0.0, 0.0f));
    int uniqueId = 1;
    // Start drawing nodes.
    ed::BeginNode(uniqueId++);
        ImGui::Text("Node A");
        ed::BeginPin(uniqueId++, ed::PinKind::Input);
            ImGui::Text("-> In");
        ed::EndPin();
        ImGui::SameLine();
        ed::BeginPin(uniqueId++, ed::PinKind::Output);
            ImGui::Text("Out ->");
        ed::EndPin();
    ed::EndNode();
    ed::End();
    ed::SetCurrentEditor(nullptr);
}
