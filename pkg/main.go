package main

import (
	"go.uber.org/zap"
	"minio_mate/pkg/minio"
	"minio_mate/pkg/util"
	"os"
	"os/signal"
)

func main() {
	util.Logger().Debug("this is a debug msg")
	util.Logger().Info("this is a info msg")
	util.Logger().Error("this is a error msg")
	err := minio.Start()
	if err != nil {
		util.Logger().Error("start minio server failed ", zap.Error(err))
	} else {
		os.Exit(1)
	}
	interrupt := make(chan os.Signal, 1)
	signal.Notify(interrupt, os.Interrupt)
	for {
		select {
		case <-interrupt:
			return
		}
	}
}
