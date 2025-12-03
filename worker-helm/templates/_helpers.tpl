{{- define "worker-helm.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "worker-helm.fullname" -}}
{{- printf "%s" .Chart.Name -}}
{{- end }}

{{- define "worker-helm.labels" -}}
app.kubernetes.io/name: {{ include "worker-helm.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
