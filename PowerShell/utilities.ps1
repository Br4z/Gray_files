# ---------------------------------------------------------------------------- #
#                                    ALIASES                                   #
# ---------------------------------------------------------------------------- #

Set-Alias -Name k -Value kubectl
Set-Alias -Name vi -Value nvim
function mkcd($dir) { mkdir $dir -Force; cd $dir }
function programming { cd G:/Programming }
function src { echo "reloading profile file..."; . $PROFILE }

# ---------------------------------------------------------------------------- #
#                                   FUNCTIONS                                  #
# ---------------------------------------------------------------------------- #

function run_c {
	Write-Host "Compiling..."

	if ($args[0] -eq 0) {
		if (Test-Path $args[1]) {
			& "g++" -Wall -Wextra -Wpedantic -Werror $args[1] -o main
			$args = $args[2..($args.Length - 1)]
		} else {
			Write-Error "Error: source file not found"
			return 1
		}
	} else {
		$sourceFiles = Get-ChildItem -Filter "*.cpp" -Recurse

		if ($sourceFiles.Count -eq 0) {
			Write-Error "Error: no .cpp files found"
			return 1
		}
		& "g++" -Wall -Wextra -Wpedantic -Werror $sourceFiles.FullName -o main
		$execution_args = $args[1..($args.Length - 1)]
	}

	if (Test-Path "./main.exe") {
		Write-Host "Executing..."

		& ./main.exe $execution_args
		Remove-Item ./main.exe
	} else {
		return 1
	}
}

function run_java {
	Write-Host "Compiling..."

	if ($args[0] -eq 0) {
		if (Test-Path $args[1]) {
			& "javac" $args[1]
			$execution_args = $args[2..($args.Length - 1)]
		} else {
			Write-Error "Error: source file not found"
			return 1
		}

		if ($LASTEXITCODE -eq 0) {
			Write-Host "Executing..."

			$class_name = [System.IO.Path]::GetFileNameWithoutExtension($args[1])
			& "java" $class_name $execution_args
		} else {
			return 1
		}
	} else {
		if (Test-Path "src/Main.java") {
			& "javac" -d out src/Main.java

			if ($LASTEXITCODE -eq 0 -And (Test-Path "src/assets")) {
				Copy-Item -Path "src/assets" -Destination "out" -Recurse -Force
			}

		} else {
			Write-Error "Error: src/Main.java file not found"
			return 1
		}

		$execution_args = $args[1..($args.Length - 1)]

		if ($LASTEXITCODE -eq 0) {
			Write-Host "Executing..."

			& "java" -cp out src.Main $execution_args

			# Remove compiled files
			# Remove-Item "out" -Recurse -Force
		} else {
			return 1
		}
	}
}

function ffe {
	$selected_file = $(fzf --preview "bat --style=numbers --color=always --line-range :500 {}")

	if ($selected_file) {
		nvim $selected_file
	}
}

function ff($name) {
	find -name $name
}
