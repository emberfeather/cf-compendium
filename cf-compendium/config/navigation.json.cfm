/**
 * cf-compendium navigation
 */
{
	path: '/cf-compendium/inc/',
	section: {
		admin: {
			title: 'Admin',
			subsection: {
				tools: {
					title: 'Tools',
					view: {
						style: {
							title: 'Style'
							action: {
								markup: {
									title: 'Markup Guide',
									desc: 'A HTML markup guide useful for testing styles against.'
								},
								form: {
									title: 'Form Test',
									desc: 'A form for testing all possible form elements.'
								}
							}
						},
						profile: {
							title: 'Profiling',
							action: {
								page: {
									title: 'Pages'
								}
							}
						}
					}
				},
				errors: {
					title: 'Errors',
					allow: 'Diety,Security',
					desc: 'Error tracking and details.',
					view: {
						conversation: {
							title: 'Conversation',
							desc: 'Error Conversations grouped by similarity into conversations.',
							action: {
								list: {
									title: 'List Error Conversations',
									navTitle: 'List Conversations'
								},
								view: {
									title: 'View Error Conversation',
									navTitle: ''
								}
							}
						},
						trend: {
							title: 'Error Trends',
							desc: 'Correlated trends in errors.',
							action: {
								meta: {
									title: 'Meta Information'
								}
							}
						}
					}
				}
			}
		},
		support: {
			title: 'Support',
			subsection: {
				documentation: {
					title: 'Documentation',
					desc: 'Documentation for the application.',
					action: {
						list: {
							title: 'List Documentation'
						}
					},
					view: {
						document: {
							title: 'Display Documentation',
							navTitle: '',
							action: {
								add: {
									title: 'Add Documentation'
								},
								edit: {
									title: 'Edit Documentation',
									navTitle: ''
								},
								remove: {
									title: 'Remove Documentation',
									navTitle: ''
								}
							}
						}
					}
				},
				tutorial: {
					title: 'Tutorials',
					desc: 'Tutorials for the application.',
					action: {
						list: {
							title: 'List Tutorials'
						}
					},
					view: {
						tutorial: {
							title: 'Display Tutorial',
							navTitle: '',
							action: {
								add: {
									title: 'Add Tutorial'
								},
								display: {
									title: 'Display Tutorial',
									navTitle: ''
								},
								edit: {
									title: 'Edit Tutorial',
									navTitle: ''
								},
								remove: {
									title: 'Remove Tutorial',
									navTitle: ''
								}
							}
						}
					}
				},
				navigation: {
					title: 'Navigation',
					desc: 'A detailed listing of the navigation available.',
					action: {
						list: {
							title: 'List Navigation'
						}
					}
				},
				contact: {
					title: 'Contact',
					desc: 'A list of those in charge of the application.',
					action: {
						list: {
							title: 'List Contacts'
						},
						email: {
							title: 'Email Contact'
						}
					}
				}
			}
		}
	}
}