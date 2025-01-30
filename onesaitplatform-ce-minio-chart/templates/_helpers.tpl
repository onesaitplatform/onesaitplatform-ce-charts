{{- define "onesait-platform.minio.name" -}}
{{- default .Chart.Name .Values.minio.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.minioadminingress.name" -}}
{{- default .Chart.Name .Values.minioadminingress.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "onesait-platform.miniobrowseringress.name" -}}
{{- default .Chart.Name .Values.miniobrowseringress.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}