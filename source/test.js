// @ts-nocheck
'use strict'

module.exports = require('docpad-plugintester')
	.test(
		{
			testerName: 'dateurls with file extension',
			testPath: __dirname + '/../test/fileextension',
			autoExit: 'safe',
		},
		{
			plugins: {
				dateurls: {
					cleanurl: false,
				},
			},
		}
	)

	.test(
		{
			testerName: 'dateurls cleanurls',
			testPath: __dirname + '/../test/cleanurls',
			autoExit: 'safe',
		},
		{
			plugins: {
				dateurls: {
					cleanurl: true,
				},
			},
		}
	)

	.test(
		{
			testerName: 'dateurls with trailing slashs',
			testPath: __dirname + '/../test/trailingslash',
		},
		{
			plugins: {
				dateurls: {
					cleanurl: true,
					trailingSlashes: true,
				},
			},
		}
	)

	.test(
		{
			testerName: 'dateurls with custom format',
			testPath: __dirname + '/../test/customformat',
		},
		{
			plugins: {
				dateurls: {
					cleanurl: true,
					trailingSlashes: true,
					dateFormat: '/YYYY/MM',
				},
			},
		}
	)
