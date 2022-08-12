package minio

import (
	"github.com/paas-mate/gutil"
	"go.uber.org/zap"
	"minio_mate/pkg/config"
	"minio_mate/pkg/path"
	"minio_mate/pkg/util"
)

func Start() error {
	if config.ClusterEnable {
		return StartCluster()
	} else {
		return StartStandAlone()
	}
}

func StartCluster() error {
	stdout, stderr, err := gutil.CallScript(path.MinioStartScript)
	util.Logger().Info("shell result ", zap.String("stdout", stdout), zap.String("stderr", stderr))
	return err
}

func StartStandAlone() error {
	stdout, stderr, err := gutil.CallScript(path.MinioStartStandAloneScript)
	util.Logger().Info("shell result ", zap.String("stdout", stdout), zap.String("stderr", stderr))
	return err
}
