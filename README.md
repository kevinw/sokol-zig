To build:

```
zig build play
```

The error:

$ zigr build play
LLVM ERROR: Cannot select: 0x7fa20895d480: i64 = bitcast 0x7fa20895d418
  0x7fa20895d418: i32,ch,glue = CopyFromReg 0x7fa20895d3b0, Register:i32 %eax, 0x7fa20895d3b0:1
    0x7fa208945468: i32 = Register %eax
    0x7fa20895d3b0: ch,glue = callseq_end 0x7fa20895d348, TargetConstant:i64<0>, TargetConstant:i64<0>, 0x7fa20895d348:1
      0x7fa20994eb38: i64 = TargetConstant<0>
      0x7fa20994eb38: i64 = TargetConstant<0>
      0x7fa20895d348: ch,glue = X86ISD::CALL 0x7fa20895d278, TargetGlobalAddress:i64<%sg_buffer (%sg_buffer_desc*)* @sg_make_buffer> 0, Register:i64 %rdi, RegisterMask:Untyped, 0x7fa20895d278:1
        0x7fa20895d2e0: i64 = TargetGlobalAddress<%sg_buffer (%sg_buffer_desc*)* @sg_make_buffer> 0
        0x7fa20994f1b8: i64 = Register %rdi
        0x7fa209888038: Untyped = RegisterMask
        0x7fa20895d278: ch,glue = CopyToReg 0x7fa20895d210, Register:i64 %rdi, 0x7fa20895d140
          0x7fa20994f1b8: i64 = Register %rdi
          0x7fa20895d140: i64,ch = load<LD8[%b_ptr](dereferenceable)> 0x7fa20895d0d8, FrameIndex:i64<8>, undef:i64
            0x7fa20895d070: i64 = FrameIndex<8>
            0x7fa20994efb0: i64 = undef
In function: main.0
The following command exited with error code 1:
/Users/kevin/src/zig/build_release/bin/zig build-exe /Users/kevin/src/sokol-zig/src/main.zig --object /Users/kevin/src/sokol-zig/zig-cache/sokol.o --cache-dir /Users/kevin/src/sokol-zig/zig-cache --output /Users/kevin/src/sokol-zig/zig-cache/foo --name foo --library c --library epoxy --library m --library png --library glfw --library z -isystem /Users/kevin/src/sokol-zig/c-headers
error: UncleanExit
_Builder_spawnChildEnvMap: 0x10e62cf96 in ??? (???)
_Builder_spawnChild: 0x10e63b6f9 in ??? (???)
_LibExeObjStep_makeZig: 0x10e62edfa in ??? (???)
_LibExeObjStep_make: 0x10e62a9b2 in ??? (???)
_Step_make: 0x10e61a1ca in ??? (???)
_Builder_makeOneStep: 0x10e618f81 in ??? (???)
_Builder_makeOneStep: 0x10e618f1b in ??? (???)
_Builder_makeOneStep: 0x10e618f1b in ??? (???)
_Builder_make: 0x10e6141ec in ??? (???)
_main.0: 0x10e611124 in ??? (???)

Build failed. The following command failed:
./zig-cache/build /Users/kevin/src/zig/build_release/bin/zig . ./zig-cache play
```
