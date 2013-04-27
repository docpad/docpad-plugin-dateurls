# Export Plugin Tester
module.exports = (testers) -> 
	# Define Plugin Tester
	class MyTester extends testers.RendererTester
		#configuration
		docpadConfig: 
			logLevel: 5
			enabledPlugins:
				'dateurls': true
				'eco': true
				'marked': true