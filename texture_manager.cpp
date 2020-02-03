#include <Application.h>
#include <texture_manager.h>

// implement static members.
std::unordered_map<GLuint, std::unique_ptr<QOpenGLTexture>> texture_manager::texture_owner;

// The node editor needs us to implement Application_*Texture* functions.
// These are called as functions but our implementation is in a method.
// So, we need these little call-forwarder functions
void* Application_LoadTexture(char const* path)
{
    return texture_manager::LoadTexture(path);
}

void Application_DestroyTexture(ImTextureID texture)
{
    return texture_manager::DestroyTexture(texture);
}

int Application_GetTextureWidth(void* id)
{
    return texture_manager::GetTextureWidth(id);
}

int Application_GetTextureHeight(void* id)
{
    return texture_manager::GetTextureHeight(id);
}

void* texture_manager::LoadTexture(const char* path)
{
    // Use QT's image loading and opengl texture creation shit.
    // Create a raw pointer so we construct the thing
    // which creates a OpenGL ID and uploads it to the graphics card.

    QImage j(path);

    QOpenGLTexture* t_ptr = new QOpenGLTexture(QImage(path).mirrored());
    t_ptr->setMinificationFilter(QOpenGLTexture::LinearMipMapLinear);
    t_ptr->setMagnificationFilter(QOpenGLTexture::Linear);

    // now that we have an ID, we can put the pointer into a unique_ptr which
    // can safely carry it to the destruction function DestroyTexture
    GLuint gid = t_ptr->textureId();

    // Some book-keeping to maintain clear ownership and link between ID and pix data
    // std::unordered_map<GLuint, std::unique_ptr<QOpenGLTexture>> texture_owner;
    texture_owner[gid] = std::unique_ptr<QOpenGLTexture>(t_ptr);

    return (ImTextureID)gid;
}

void texture_manager::DestroyTexture(ImTextureID texture)
{
    //resture our GLuint from our void*
    GLuint gid = (GLuint)texture;

    // (TODO) actually delete the texture on the graphics card side.

    // destroy the QImage
    texture_owner.erase(gid);
}

int texture_manager::GetTextureWidth(ImTextureID texture)
{
    //restore our GLuint from our void*
    GLuint gid = (GLuint)texture;

    // use hash table to lookup QOpenGLTexture unique pointer
    return texture_owner[gid]->width();

}

int texture_manager::GetTextureHeight(ImTextureID texture)
{
    //restore our GLuint from our void*
    GLuint gid = (GLuint)texture;

    // use hash table to lookup QOpenGLTexture unique pointer
    return texture_owner[gid]->height();
}
