workspace "Loom"
    architecture "x64"

    configurations {
        "Debug",
        "Release",
        "Dist"
    }

    startproject "Loom"

-- This is a helper variable, to concatenate the sys-arch
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Loom"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir("bin/" .. outputdir .. "/{prj.name}")
    objdir("bin-int/" .. outputdir .. "/{prj.name}")

    files {
        "Loom/src/**.cpp",
        "Loom/include/**.h",
        "Loom/vendor/GLFW/include/GLFW/glfw3.h",
        "Loom/vendor/GLFW/include/GLFW/glfw3native.h",
        "Loom/vendor/GLFW/src/glfw_config.h",
        "Loom/vendor/GLFW/src/context.c",
        "Loom/vendor/GLFW/src/init.c",
        "Loom/vendor/GLFW/src/input.c",
        "Loom/vendor/GLFW/src/monitor.c",
        "Loom/vendor/GLFW/src/vulkan.c",
        "Loom/vendor/GLFW/src/window.c",
        "Loom/vendor/glad/include/glad/glad.h",
        "Loom/vendor/glad/include/glad/KHR/khrplatform.h",
		"Loom/vendor/glad/src/glad.c"
    }

    includedirs {
        "Loom/include",
        "Loom/vendor/GLFW/include",
        "Loom/vendor/glad/include",
        "Loom/vender/GLFW/lib"
    }

    filter "system:windows"
        buildoptions { "-lgdi32" }
        systemversion "latest"

        files {
            "Loom/vendor/GLFW/src/win32_init.c",
            "Loom/vendor/GLFW/src/win32_joystick.c",
            "Loom/vendor/GLFW/src/win32_monitor.c",
            "Loom/vendor/GLFW/src/win32_time.c",
            "Loom/vendor/GLFW/src/win32_thread.c",
            "Loom/vendor/GLFW/src/win32_window.c",
            "Loom/vendor/GLFW/src/win32_module.c",
            "Loom/vendor/GLFW/src/wgl_context.c",
            "Loom/vendor/GLFW/src/egl_context.c",
            "Loom/vendor/GLFW/src/osmesa_context.c",
            "Loom/vendor/GLFW/src/context.c",
            "Loom/vendor/GLFW/src/init.c",
            "Loom/vendor/GLFW/src/input.c",
            "Loom/vendor/GLFW/src/monitor.c",
            "Loom/vendor/GLFW/src/platform.c",
            "Loom/vendor/GLFW/src/window.c",
            "Loom/vendor/GLFW/src/null_init.c",
            "Loom/vendor/GLFW/src/null_joystick.c",
            "Loom/vendor/GLFW/src/null_monitor.c",
            "Loom/vendor/GLFW/src/null_window.c"
        }

        defines  {
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

    filter { "configurations:Debug" }
        buildoptions "/MTd"
        runtime "Debug"
        symbols "on"

    filter { "configurations:Release" }
        buildoptions "/MT"
        runtime "Release"
        optimize "on"

