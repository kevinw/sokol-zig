const std = @import("std");
const os = std.os;
const assert = std.debug.assert;
const c = @import("c.zig");
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

    _ = c.printf(c"init!\n");

    var desc:c.sg_desc = undefined;
    const desc_ptr:[*]c.sg_desc = @ptrCast([*]c.sg_desc, &desc);
    c.sg_setup(desc_ptr);
}
