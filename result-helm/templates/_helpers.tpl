{{/*
Generate a fully qualified name for resources
*/}}
{{- define "result-helm.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Simple chart name helper
*/}}
{{- define "result-helm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels helper
*/}}
{{- define "result-helm.labels" -}}
app.kubernetes.io/name: {{ include "result-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/*
Return the ServiceAccount name
*/}}
{{- define "result-helm.serviceAccountName" -}}
{{- if .Values.serviceAccount.name -}}
{{ .Values.serviceAccount.name }}
{{- else -}}
{{ include "result-helm.fullname" . }}
{{- end -}}
{{- end -}}
