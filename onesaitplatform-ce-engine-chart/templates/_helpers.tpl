{{/* vim: set filetype=mustache: */}}
{{/*
  Expand the name of the chart.
*/}}

{{- define "onesait-platform.semanticinfbroker.name" -}}
{{- default .Chart.Name .Values.semanticinfbroker.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.iotbroker.name" -}}
{{- default .Chart.Name .Values.iotbroker.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.apimanager.name" -}}
{{- default .Chart.Name .Values.apimanager.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.flowengine.name" -}}
{{- default .Chart.Name .Values.flowengine.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.flowenginesecondary.name" -}}
{{- default .Chart.Name .Values.flowenginesecondary.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.oauthserver.name" -}}
{{- default .Chart.Name .Values.oauthserver.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.auditrouter.name" -}}
{{- default .Chart.Name .Values.auditrouter.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "annotations.keepresources" }}
  annotations:
    "helm.sh/resource-policy": keep
{{- end }}
