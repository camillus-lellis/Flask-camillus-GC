import pytest
from app import app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_homepage(client):
    """Testa a resposta da home page."""
    response = client.get('/')
    assert response.status_code == 200
    assert b'Hello, World from Camillus_Cam-ci!' in response.data