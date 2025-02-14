{{/* vim: set filetype=mustache: */}}
{{/*
  Expand the name of the chart.
*/}}

{{- define "onesait-platform.gitlabmanager.name" -}}
{{- default .Chart.Name .Values.gitlabmanager.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}