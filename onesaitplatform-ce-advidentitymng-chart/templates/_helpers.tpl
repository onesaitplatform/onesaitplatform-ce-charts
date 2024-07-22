{{/* vim: set filetype=mustache: */}}
{{/*
  Expand the name of the chart.
*/}}

{{- define "onesait-platform.advidentitymanager.name" -}}
{{- default .Chart.Name .Values.advidentitymanager.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.advidentitymanagermng.name" -}}
{{- default .Chart.Name .Values.advidentitymanagermng.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
