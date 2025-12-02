
{{/*
Generate a fully qualified name for resources
*/}}
{{- define "result-helm.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the ServiceAccount name
*/}}
{{- define "result-helm.serviceAccountName" -}}
{{- if .Values.serviceAccount.name }}
{{ .Values.serviceAccount.name }}
{{- else }}
{{ include "result-helm.fullname" . }}
{{- end }}
{{- end }}

{{- define "result-helm.labels" -}}
app.kubernetes.io/name: {{ include "result-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
