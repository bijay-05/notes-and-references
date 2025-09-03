# AWS CloudFormation

A template is a text file that defines all the resources within a stack. A stack is the deployment of a **CloudFormation** template. From a single template, you can create multiple stacks. Each stack contains a collection of AWS resources that can be managed as a single unit.

> When you us **CloudFormation**, you work with templates and stacks. You create templates to describe your AWS resources and their properties. Whenever you create a stack, **CloudFormation** provisions the resources that are described in your template.

## Sections on Template

1. **Parameters**
This section declares values that can be passed to the template when you create the stack. Resources specified later in the template reference these values and use the data. Parameters are an effective way to specify information that you don't want to store in the template itself.

**Template** is a blueprint which contains configurations and resources to be deployed on AWS, while **Stack** is the deployment of cloudformation **Template**.