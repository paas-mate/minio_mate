package path

import (
	"os"
	"path/filepath"
)

// minio
var (
	MinioHome = os.Getenv("MINIO_HOME")
)

// mate
var (
	MinioMatePath              = filepath.FromSlash(MinioHome + "/mate")
	MinioScripts               = filepath.FromSlash(MinioMatePath + "/scripts")
	MinioStartScript           = filepath.FromSlash(MinioScripts + "/start-minio.sh")
	MinioStartStandAloneScript = filepath.FromSlash(MinioScripts + "/start-minio-stand-alone.sh")
)
