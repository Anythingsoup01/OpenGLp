workspace "OpenGLpractice"
	architecture "x64"

    configurations
	{
		"Debug",
		"Release"
	}


outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["Glad"] = "OpenGL/vendor/Glad/include"
include "OpenGL/vendor/glad"

IncludeDir["GLFW"] = "OpenGL/vendor/GLFW/include"
include "OpenGL/vendor/GLFW"

project "OpenGL"
	location "OpenGL"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{IncludeDir.Glad}",
        "%{IncludeDir.GLFW}"
	}

    libdirs 
    {
       "OpenGL/vendor/glad/bin/Debug-windows-x86_64/Glad",
       "OpenGL/vendor/GLFW/bin/Debug-windows-x86_64/GLFW"
    }

	links
	{
        "Glad.lib",
        "GLFW.lib"
    }

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"