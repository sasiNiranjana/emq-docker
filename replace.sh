#!/bin/sh -x
depsLineNumber=`sed -n  -e '/DEPS += /=' Makefile`
depsLine=`sed -n  -e '/DEPS += /p' Makefile | tr -d '\\'`
depsLfOnlineStatusAppend="lf_emqtt_online_status_submit"
depsNewLine=$depsLine$depsLfOnlineStatusAppend
sed -i "$depsLineNumber c $depsNewLine \\\\" Makefile
depsLineNumber=`sed -n  -e '/dep_emq_dashboard/=' Makefile`
depsLine="dep_emq_dashboard = git https://github.com/sasiNiranjana/emq-dashboard.git master"
#sed -i "$depsLineNumber c $depsLine" Makefile
depsLFOnlineStatusSubmit="dep_lf_emqtt_online_status_submit = git https://github.com/sasiNiranjana/genserver_lf_emqtt_online_status_publish.git master"
sed -i "$depsLineNumber a $depsLFOnlineStatusSubmit" Makefile
depsLineNumber=`sed -n  -e '/{emq_plugin_template, load}/=' relx.config`
depsLine="{emq_plugin_template, load},"
sed -i "$depsLineNumber c $depsLine" relx.config
depsLine="{lf_emqtt_online_status_submit, load}"
sed -i "$depsLineNumber a $depsLine" relx.config
