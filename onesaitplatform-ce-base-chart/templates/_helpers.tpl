{{/* vim: set filetype=mustache: */}}
{{/*
  Expand the name of the chart.
*/}}
{{- define "onesait-platform.configdb.name" -}}
{{- default .Chart.Name .Values.configdb.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.schedulerdb.name" -}}
{{- default .Chart.Name .Values.schedulerdb.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.realtimedb.name" -}}
{{- default .Chart.Name .Values.realtimedb.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.quasar.name" -}}
{{- default .Chart.Name .Values.quasar.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.zookeeper.name" -}}
{{- default .Chart.Name .Values.zookeeper.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.kafka.name" -}}
{{- default .Chart.Name .Values.kafka.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.elasticdb.name" -}}
{{- default .Chart.Name .Values.elasticdb.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.configinit.name" -}}
{{- default .Chart.Name .Values.configinit.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.cacheserver.name" -}}
{{- default .Chart.Name .Values.cacheserver.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.controlpanel.name" -}}
{{- default .Chart.Name .Values.controlpanel.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.monitoringui.name" -}}
{{- default .Chart.Name .Values.monitoringui.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.loadbalancer.name" -}}
{{- default .Chart.Name .Values.loadbalancer.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.ingress.name" -}}
{{- default .Chart.Name .Values.loadbalanceringress.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
