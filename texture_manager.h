#ifndef texture_manager_H
#define texture_manager_H
#include <ImGuiRenderer.h>
#include <memory>
#include <unordered_map>
#include <QOpenGLTexture>

class texture_manager : public QOpenGLExtraFunctions
{

public:
    static void* LoadTexture(char const*);
    static void DestroyTexture(void*);
    static int GetTextureWidth(void*);
    static int GetTextureHeight(void*);

private:
    texture_manager();
    static std::unordered_map<GLuint, std::unique_ptr<QOpenGLTexture>> texture_owner;
};

#endif // texture_manager_H
