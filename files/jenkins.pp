node 'jenkins.example.com' {
    include jenkins
}
jenkins::plugin { 'git-client': ;
	'promoted-builds': ;
	'credentials': ;
	'scm-api': ;
	'mailer': ;
	'token-macro': ;
	'matrix-project': ;
	'ssh-credentials': ;
	'parameterized-trigger': ;
	'git': ;
	'scriptler': ;
	'uno-choice': ;
	'ansicolor': ;
	'build-blocker-plugin': ;
	'dashboard-view': ;
	'analysis-core': ;
	'checkstyle': ;
	'chucknorris': ;
	'clover': ;
	'junit': ;
	'config-file-provider': ;
	'script-security': ;
	'email-ext': ;
	'envfile': ;
	'ivy': ;
	'nant': ;
	'envinject': ;
	'extended-choice-parameter': ;
	'findbugs': ;
	'nested-view': ;
	'nodejs': ;
	'pmd': ;
	'tap': ;
	'update-sites-manager': ;
}
