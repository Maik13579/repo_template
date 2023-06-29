from setuptools import find_packages, setup

with open("app/README.md", "r") as f:
    long_description = f.read()

setup(
    name="[PYTHON_PACKAGE_NAME]",
    version="[VERSION]",
    description="",
    package_dir={"": "app"},
    packages=find_packages(where="app"),
    long_description=long_description,
    long_description_content_type="text/markdown",
    author="[AUTHOR]]",
    author_email="[AUTHOR_EMAIL]",
    license="MIT",
    classifiers=[
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: >=3.8",
        "Operating System :: OS Independent",
    ],
    install_requires=[],
    python_requires=">=3.8",
)
