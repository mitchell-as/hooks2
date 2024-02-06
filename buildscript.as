let:
	runtime = state_tool_artifacts_v1(
		build_flags = [
		],
		src = "$sources"
	)
	sources = solve(
		at_time = "$at_time",
		platforms = [
			"78977bc8-0f32-519d-80f3-9043f059398c"
		],
		requirements = [
			{
				name = "perl",
				namespace = "language",
				version_requirements = [
					{
						comparator = "eq",
						version = "5.36.3"
					}
				]
			},
			{
				name = "JSON",
				namespace = "language/perl",
				version_requirements = [
					{
						comparator = "eq",
						version = "4.09"
					}
				]
			}
		],
		solver_version = null
	)
	windows_installer_0_78977bc8_0f32_519d_80f3_9043f059398c = windows_installer(
		at_time = "2024-02-06T17:00:10.163000Z",
		memory = 4000,
		name = "78977bc8-0f32-519d-80f3-9043f059398c",
		platform = "78977bc8-0f32-519d-80f3-9043f059398c",
		src = "$runtime"
	)

in:
	windows_installer_0_78977bc8_0f32_519d_80f3_9043f059398c