const std = @import("std");
const os = std.os;
const assert = std.debug.assert;
const c = @import("c.zig");
const mem = @import("std").mem;
use @import("math3d.zig");

extern fn error_callback(err: c_int, description: ?[*]const u8) void {
    _ = c.printf(c"Error: %s\n", description);
    os.abort();
}

pub fn main() void {
    _ = c.glfwSetErrorCallback(error_callback);

    if (c.glfwInit() == c.GL_FALSE) {
        _ = c.printf(c"GLFW init failure\n");
        os.abort();
    }
    defer c.glfwTerminate();

    c.glfwWindowHint(c.GLFW_CONTEXT_VERSION_MAJOR, 3);
    c.glfwWindowHint(c.GLFW_CONTEXT_VERSION_MINOR, 3);
    c.glfwWindowHint(c.GLFW_OPENGL_FORWARD_COMPAT, c.GL_TRUE);
    c.glfwWindowHint(c.GLFW_OPENGL_PROFILE, c.GLFW_OPENGL_CORE_PROFILE);
    var w = c.glfwCreateWindow(640, 480, c"Sokol Triangle GLFW", null, null);
    c.glfwMakeContextCurrent(w);
    c.glfwSwapInterval(1);

    _ = c.printf(c"calling sokol init\n");

    var desc:c.sg_desc = undefined;

    var desc_bytes:[*]u8 = @ptrCast([*]u8, &desc);
    @memset(desc_bytes, 0, @sizeOf(c.sg_desc));

    const desc_ptr:[*]c.sg_desc = @ptrCast([*]c.sg_desc, &desc);
    c.sg_setup(desc_ptr);

    _ = c.printf(c"did do sokol init\n");

    const vertices = []f32{
        0.0, 0.5, 0.5,     1.0, 0.0, 0.0, 1.0,
        0.5, -0.5, 0.5,    0.0, 1.0, 0.0, 1.0,
        -0.5, -0.5, 0.5,   0.0, 0.0, 1.0, 1.0
    };

    var buffer_desc:c.sg_buffer_desc = undefined;
    {
        buffer_desc.size = @sizeOf(@typeOf(vertices));
        buffer_desc.content = @ptrCast(?*const c_void, &vertices);
    }

    const b_ptr = @ptrCast([*]const c.sg_buffer_desc, &buffer_desc);
    const vbuf = c.sg_make_buffer(b_ptr);
}
