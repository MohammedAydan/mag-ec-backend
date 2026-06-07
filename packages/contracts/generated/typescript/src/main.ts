import { AuthenticationApi } from "./apis";
import { Configuration } from "./runtime";

const main = async () => {
    const config = new Configuration({
        basePath: "http://localhost:3003",
    });

    const auth = new AuthenticationApi(config);

    const response = await auth.authLogin({
        loginDto: {
            email: "admin@gmail.com",
            password: "Admin@123",
        }
    });

    console.log("Login successful, received token:", response.accessToken);
    console.log("Login successful, received token:", response.user);
}

main().catch((error) => {
    console.error('Error in main execution:', error);
});
