rule golang
{
    meta:
        description = "Golang"

    strings:
        $s1 = "Go build"
        $s2 = "go.build"
	$s3 = "runtime.decoderune"
	$s4 = "golang"
        $go = "/go-"

    condition:
        any of ($s*) or #go > 10
}

rule rust
{
    meta:
        description = "Rust"

    strings:
        $s1 = "rustc"
        $s2 = "crates.io"
        $s3 = "cargo"

    condition:
        any of ($s*)
}
