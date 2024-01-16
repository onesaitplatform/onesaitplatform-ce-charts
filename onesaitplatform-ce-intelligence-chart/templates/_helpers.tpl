{{/* vim: set filetype=mustache: */}}
{{/*
  Expand the name of the chart.
*/}}

{{- define "onesait-platform.streamsets.name" -}}
{{- default .Chart.Name .Values.streamsets.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.dashboard.name" -}}
{{- default .Chart.Name .Values.dashboard.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.notebook.name" -}}
{{- default .Chart.Name .Values.notebook.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "annotations.keepresources" }}
  annotations:
    "helm.sh/resource-policy": keep
{{- end }}
