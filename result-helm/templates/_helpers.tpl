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
