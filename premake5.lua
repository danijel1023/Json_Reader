workspace "json_reader"
	startproject "application"

    platforms { "64" }
    configurations { "Debug", "Release" }
	architecture "x64"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "json_reader"
	location "json_reader"
	kind "StaticLib"
	language "C++"
	staticruntime "Off"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"%{prj.location}/**.c",
		"%{prj.location}/**.cpp",
		"%{prj.location}/**.h",
		"%{prj.location}/**.hpp",
		"%{prj.location}/**.json"
	}

	filter "system:windows"
		cppdialect "Default"
		systemversion "latest"

	filter "configurations:Debug"
		symbols "On"
		runtime "Debug"

	filter "configurations:Release"
		optimize "On"
		runtime "Release"

project "application"
	location "application"
	kind "ConsoleApp"
	language "C++"
	staticruntime "Off"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	defines {}

	includedirs { "%{wks.location}/json_reader/src/include" }

	links {
		"json_reader"
	}

	files {
		"%{prj.location}/**.c",
		"%{prj.location}/**.cpp",
		"%{prj.location}/**.h",
		"%{prj.location}/**.hpp",
		"%{prj.location}/**.json"
	}
	
	filter "system:windows"
		cppdialect "Default"
		systemversion "latest"

	filter "configurations:Debug"
		symbols "On"
		runtime "Debug"

	filter "configurations:Release"
		optimize "On"
		runtime "Release"
