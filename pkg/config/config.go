package config

import "github.com/paas-mate/gutil"

// minio config
var (
	ClusterEnable bool
	MinioNumber   int
)

func init() {
	ClusterEnable = gutil.GetEnvBool("CLUSTER_ENABLE", false)
	MinioNumber = gutil.GetEnvInt("MINIO_NUMBER", 4)
}
