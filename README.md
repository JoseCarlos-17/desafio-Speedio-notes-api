# README

comando para instalar as gems do projeto: bundle install
comando para executar as migrations: rails db:migrate

ENDPOINTS:

Listar anotação
	path: '/notes'
	status code: 200 OK
	
	response:
		{
			{
				"id": 1,
				"content": "Lorem ipsum content note",
				"created_at": "2024-01-20T21:05:03.233Z"
			},
			{
				"id": 2,
				"content": "Lorem ipsum content note",
				"created_at": "2024-01-20T21:05:03.233Z"
			},
			{
				"id": 3,
				"content": "Lorem ipsum content note",
				"created_at": "2024-01-20T21:05:03.233Z"
			},
		}
	
======================================================

Selecionar anotação
	path: '/notes/:id'
	status code: 200 OK

	response:	
		{
			{
				"id": 1,
				"content": "Lorem ipsum content note",
				"created_at": "2024-01-20T21:05:03.233Z"
			}
		}
	
======================================================

Deletar anotação
	path: '/notes/:id'
	status code: 204 no_content

=======================================================

Criar anotação
	path: '/notes'
	
	request body:
		{
			"note": {
				"content": "Lorem ipsum"
			}
		}
		
	response:
		{
			{
				"id": 3,
				"content": "Lorem ipsum"

			}
		}
	
	status code: 201 created
	
