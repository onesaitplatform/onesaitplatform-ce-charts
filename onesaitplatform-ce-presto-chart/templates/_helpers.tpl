{{- define "onesait-platform.presto.name" -}}
{{- default .Chart.Name .Values.presto.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
