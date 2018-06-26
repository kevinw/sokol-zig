pub use @cImport({
    @cInclude("epoxy/gl.h");
    @cInclude("GLFW/glfw3.h");
    @cInclude("png.h");
    @cInclude("math.h");
    @cInclude("stdlib.h");
    @cInclude("stdio.h");

    @cDefine("SOKOL_GLCORE33", "1");
    @cInclude("sokol_gfx.h");

    @cDefine("SOKOL_IMPL", "1");
    @cInclude("sokol_gfx.h");

});

pub fn ptr(p: var) t: {
    const T = @typeOf(p);
    const info = @typeInfo(@typeOf(p)).Pointer;
    break :t if (info.is_const) ?[*]const info.child else ?[*]info.child;
} {
    return @ptrCast(@typeInfo(@typeOf(this)).Fn.return_type.?, p);
}
