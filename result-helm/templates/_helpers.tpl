
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


/*
{{/*
Expand the name of the chart.
*/}}
{{- define "result-helm.name" -}}
{{ .Chart.Name }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "result-helm.labels" -}}
app: {{ .Values.labels.app }}
{{- end }}
*/
