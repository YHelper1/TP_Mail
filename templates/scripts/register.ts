import { createHash } from 'crypto';

function getSHA256Hash(input: string): string {
      const hash = createHash('sha256');
      hash.update(input);
      return hash.digest('hex'); // 'hex' encoding returns a hexadecimal string
}


var form = document.getElementById('myForm') as HTMLFormElement;

form.addEventListener('submit', (event: SubmitEvent) => {
  event.preventDefault();
  const formData = new FormData(form);
  const domain = formData.get('domain') as string;
  const password = getSHA256Hash(formData.get('password') as string);

  fetch('/register', {
     method: 'POST',
     body: formData,
   })
   .then(response => response.json())
   .then(data => console.log(data))
   .catch(error => console.error('Error:', error));
});