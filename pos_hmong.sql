-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 17, 2022 at 01:17 PM
-- Server version: 8.0.28
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_hmong`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjust_product_stock_types`
--

CREATE TABLE `tbbook` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `surname` int DEFAULT NULL,
  `tel` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adjust_product_stock_types`
--

INSERT INTO `adjust_product_stock_types` (`id`, `title`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Damaged Product', 1, '2022-05-07 04:29:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taxable` tinyint NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  `tax_id` int NOT NULL DEFAULT '0',
  `is_cash_register` tinyint NOT NULL,
  `is_shipment` tinyint NOT NULL,
  `user_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `branch_type`, `taxable`, `is_default`, `tax_id`, `is_cash_register`, `is_shipment`, `user_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'ສາຂາໃຫ່ຍ', 'retail', 1, 1, 1, 1, 1, 0, 1, '2022-05-07 04:29:16', '2022-06-17 11:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int NOT NULL,
  `sales_invoice_id` int NOT NULL,
  `receiving_invoice_id` int NOT NULL,
  `created_by` int NOT NULL,
  `multiple_access` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `title`, `branch_id`, `sales_invoice_id`, `receiving_invoice_id`, `created_by`, `multiple_access`, `created_at`, `updated_at`) VALUES
(1, 'ເງິນໂອນຫຼັກ', 1, 2, 4, 1, 1, '2022-05-07 04:29:16', '2022-06-17 11:17:56');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_logs`
--

CREATE TABLE `cash_register_logs` (
  `id` int UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cash_register_id` int NOT NULL,
  `opening_amount` double DEFAULT NULL,
  `closing_amount` double DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `opening_time` datetime DEFAULT NULL,
  `closing_time` datetime DEFAULT NULL,
  `opened_by` int DEFAULT NULL,
  `closed_by` int DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cash_register_logs`
--

INSERT INTO `cash_register_logs` (`id`, `user_id`, `cash_register_id`, `opening_amount`, `closing_amount`, `status`, `opening_time`, `closing_time`, `opened_by`, `closed_by`, `note`, `created_at`, `updated_at`) VALUES
(1, '1', 1, 2, NULL, 'open', '2022-05-08 15:28:00', NULL, 1, NULL, NULL, '2022-05-08 08:28:28', '2022-05-08 08:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `corn_job_logs`
--

CREATE TABLE `corn_job_logs` (
  `id` int UNSIGNED NOT NULL,
  `branch_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `corn_job_logs`
--

INSERT INTO `corn_job_logs` (`id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 0, '2022-06-17 11:29:59', '2022-06-17 11:29:59'),
(2, 0, '2022-06-17 11:30:02', '2022-06-17 11:30:02');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tin_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `customer_group` int NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_default` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int UNSIGNED NOT NULL,
  `template_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `template_type`, `template_subject`, `default_content`, `custom_content`, `created_at`, `updated_at`) VALUES
(1, 'user_invitation', 'You are invited', '<html>\n                            <div style=\"max-width: 60%; color: #000000 !important; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; font-size:17px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi,<br>\n                {invited_by} invited you to join with the team on {app_name}.<br>\n                Please click the link below to accept the invitation!<br>\n                {verification_link}        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(2, 'account_verification', 'Account verification', '<html>\n                            <div style=\"max-width: 60%; color: #000000 !important; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; font-size:17px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi {first_name},<br>\n                        Your account has been created.<br>\n                        Please click the link below to verify your email.<br>\n                        {verification_link}        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(3, 'reset_password', 'Reset password', '<html>\n                            <div style=\"max-width: 60%; color: #000000 !important; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; font-size:17px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi,<br>\n                        You have requested to change your password.<br>\n                        Please click the link below to change your password!<br>\n                        {reset_password_link}        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(4, 'pos_invoice', 'Invoice', '<html>\n                            <div style=\"max-width: 60%; color: #000000 !important; font-family: Helvetica; margin:auto; padding-bottom: 10px;\">\n                                <div style=\"text-align:center; padding-top: 10px; padding-bottom: 10px;\">\n                                    <h1>{app_name}</h1>\n                                </div>\n                                <div style=\"padding: 35px;padding-left:20px; font-size:17px; border-bottom: 1px solid #cccccc; border-top: 1px solid #cccccc;\">Hi {first_name},<br>\n                        Thanks for shopping with us.<br>\n                        Please find the attachment for your purchase ({invoice_id}) details.        </div>\n                            </div>\n                        </html>', '', NULL, NULL),
(5, 'low_stock', 'Low Stock Template', '<div style=\"text-align: center; font-family: DejaVu Sans, \'Lato\', sans-serif;\">\n                            <p>{app_logo}</p>\n                            <h1 style=\"font-weight: lighter; margin-bottom: 0;\">{app_name}</h1>\n                            <br>\n                            <small>Low Stock Notification</small>\n                            <br>\n                            <h3 style=\"text-align:center;\">Out Of Stock List</h3>\n                        </div>\n                        <!--header bottom start-->\n                        <div style=\"margin-bottom:-30px; height:170px; width: 100%; overflow: hidden; display: block; font-family: DejaVu Sans, \'Lato\', sans-serif;\">\n                                <div style=\"float:left; width: 50%;\">\n                                    <p style=\"font-weight:bold;\">Branch Name: <span>{branch_name}</span></p>\n                                    <p style=\"font-weight:bold;\">Branch Manager: <span>{branch_manager}</span></p>\n                                </div>\n                                <div style=\"float:right; width: 45%;\">\n                                    <p style=\"font-weight:bold; text-align: right;\">Date : <span>{date}</span></p>\n                                    <p style=\"font-weight:bold; text-align: right;\">Time : <span>{time}</span></p>\n                                </div>\n                        </div>\n                        <table style=\"border-top: 1px solid #bfbfbf; border-bottom: 1px solid #bfbfbf; border-collapse: collapse; font-weight:500; width: 100%; max-width: 100%; margin-bottom: 0; background-color: transparent; font-family: DejaVu Sans, \'Lato\', sans-serif;\">\n                            <tr>\n                                <th style=\"text-align: left; padding: 7px 0; border-bottom: 1px solid #bfbfbf; width: 40%;\">Item</th>\n                                <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Re Order</th>\n                                <th style=\"text-align: right; padding: 7px 0; border-bottom: 1px solid #bfbfbf;\">Qty</th>\n                            </tr><br><td style=\"padding: 7px 0;\" class=\"text-center\" colspan=\"5\">{item_details}</td></table>', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invites`
--

CREATE TABLE `invites` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `invited_as` int NOT NULL,
  `invited_branch` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT '0',
  `invited_by` int NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_templates`
--

CREATE TABLE `invoice_templates` (
  `id` int UNSIGNED NOT NULL,
  `template_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default_template` tinyint NOT NULL,
  `invoice_size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_templates`
--

INSERT INTO `invoice_templates` (`id`, `template_title`, `template_type`, `is_default_template`, `invoice_size`, `default_content`, `custom_content`, `created_at`, `updated_at`) VALUES
(1, 'Small Sales Invoice', 'sales', 0, 'small', '<div class=\"invoice-page-wrapper\">\n                <div class=\"thermal-invoice\" style=\"width: 70mm;\">\n                    <!--Invoice Header-->\n                    <div class=\"text-center invoice-header mb-3\">\n                    \n                        <!--Invoice Logo-->\n                        <img src=\"{logo_source}\" width=\"100\" class=\"img-fluid\" alt=\"\">\n                        <div class=\"app-name my-2\">{app_name}</div>\n                        <div>\n                            <h6 class=\"text-uppercase font-weight-bold\">Sales Invoice</h6>\n                        </div>\n                        <small class=\"font-weight-bold\">\n                            {date} - {time}\n                        </small>\n                    </div>\n    \n                    <!--Invoice Info-->\n                    <div class=\"mb-3 font-weight-bold invoice-info\">\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Invoice ID: </span> {invoice_id}\n                        </p>\n                         <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Sold To: </span> {customer_name}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Sold By: </span> {employee_name}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Phone: </span> {phone_number}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Address: </span> {address}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">TIN: </span> {tin}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Note: </span> {note}\n                        </p>\n                    </div>\n    \n                    <!--Invoice Body-->\n                    <table class=\"table table-borderless\">\n                        <tbody class=\"font-weight-bold\">\n                            <tr class=\"border-top border-bottom t-header\">\n                                <th class=\"w-25 pl-0\">Price</th>\n                                <th class=\"text-right\">Qty</th>\n                                <th class=\"text-right\">Disc%</th>\n                                <th class=\"text-right pr-0\">Total</th>\n                            </tr>\n                            <tr><td>{item_details}</td></tr>\n                            <tr class=\"t-footer border-top\">\n                                <td class=\"text-left\">Subtotal</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{sub_total}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Shipment</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{shipment_amount}</td>\n                            </tr>\n                            <tr class=\"t-footer\"> \n                                <td class=\"text-left\">Tax</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{tax}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Discount</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{discount}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Total</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{total}</td>\n                            </tr>\n                            <tr><td>{payment_details}</td></tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Exchange</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{exchange}</td>\n                            </tr>\n                        </tbody>\n                    </table>\n                    <div class=\"shipment-address\">{shipment_address}</div>\n                    <div class=\"text-center\">{barcode}</div>\n                </div>\n            </div>', '', NULL, NULL),
(2, 'Large Sales Invoice', 'sales', 1, 'large', '<div class=\"invoice-page-wrapper\">\n                <div class=\"thermal-invoice\" style=\"width: 95mm;\">\n                    <!--Invoice Header-->\n                    <div class=\"text-center invoice-header mb-3\">\n                    \n                        <!--Invoice Logo-->\n                        <img src=\"{logo_source}\" width=\"100\" class=\"img-fluid\" alt=\"\">\n                        <div class=\"app-name my-2\">{app_name}</div>\n                        <div>\n                            <h6 class=\"text-uppercase font-weight-bold\">Sales Invoice</h6>\n                        </div>\n                        <small class=\"font-weight-bold\">\n                            {date} - {time}\n                        </small>\n                    </div>\n    \n                    <!--Invoice Info-->\n                    <div class=\"mb-3 font-weight-bold invoice-info\">\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Invoice ID: </span> {invoice_id}\n                        </p>\n                         <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Sold To: </span> {customer_name}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Sold By: </span> {employee_name}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Phone: </span> {phone_number}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Address: </span> {address}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">TIN: </span> {tin}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Note: </span> {note}\n                        </p>\n                    </div>\n    \n                    <!--Invoice Body-->\n                    <table class=\"table table-borderless\">\n                        <tbody class=\"font-weight-bold\">\n                            <tr class=\"border-top border-bottom t-header\">\n                                <th class=\"pl-0\">Items</th>\n                                <th class=\"text-right\">Qty</th>\n                                <th class=\"text-right\">Price</th>\n                                <th class=\"text-right\">Discount</th>\n                                <th class=\"text-right pr-0\">Total</th>\n                            </tr>\n                            <tr><td>{item_details}</td></tr>\n                            <tr class=\"t-footer border-top\">\n                                <td class=\"text-left\">Subtotal</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{sub_total}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Shipment</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{shipment_amount}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Tax</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{tax}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Discount</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{discount}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Total</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{total}</td>\n                            </tr>\n                            <tr><td>{payment_details}</td></tr>\n                            <tr class=\"t-footer\">\n                                <td class=\"text-left\">Exchange</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{exchange}</td>\n                            </tr>\n                        </tbody>\n                    </table>\n                    <div class=\"shipment-address\">{shipment_address}</div>\n                    <div class=\"text-center\">{barcode}</div>\n                </div>\n            </div>', '', NULL, NULL),
(3, 'Small Purchase Invoice', 'receiving', 0, 'small', '<div class=\"invoice-page-wrapper\">\n                <div class=\"thermal-invoice\" style=\"width: 70mm;\">\n                    <!--Invoice Header-->\n                    <div class=\"text-center invoice-header mb-3\">\n                    \n                        <!--Invoice Logo-->\n                         <img src=\"{logo_source}\" width=\"100\" class=\"img-fluid\" alt=\"\">\n                        <div class=\"app-name my-2\">{app_name}</div>\n                        <div>\n                            <h6 class=\"text-uppercase font-weight-bold\">Purchase Invoice</h6>\n                        </div>\n                        <small class=\"font-weight-bold\">\n                            {date} - {time}\n                        </small>\n                    </div>\n    \n                    <!--Invoice Info-->\n                    <div class=\"mb-3 font-weight-bold invoice-info\">\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Invoice ID: </span> {invoice_id}\n                        </p>\n                         <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Supplier: </span> {supplier_name}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">TIN: </span> {tin}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Purchased By: </span> {employee_name}\n                        </p>\n                    </div>\n    \n                    <!--Invoice Body-->\n                    <table class=\"table table-borderless\">\n                        <tbody class=\"font-weight-bold\">\n                            <tr class=\"border-top border-bottom t-header\">\n                                <th class=\"w-25 pl-0\">Price</th>\n                                <th class=\"text-right\">Qty</th>\n                                <th class=\"text-right\">Disc%</th>\n                                <th class=\"text-right pr-0\">Total</th>\n                            </tr>\n                            <tr><td>{item_details}</td></tr>\n                            <tr class=\"t-footer border-top\">\n                                <td>Subtotal</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{sub_total}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td>Tax</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{tax}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td>Discount</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{discount}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td>Total</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{total}</td>\n                            </tr>\n                            <tr><td>{payment_details}</td></tr>\n                            <tr class=\"t-footer\">\n                                <td>Exchange</td>\n                                <td class=\"font-weight-bold\" colspan=\"3\">{exchange}</td>\n                            </tr>\n                        </tbody>\n                    </table>\n                    <div class=\"text-center\">{barcode}</div>\n                </div>\n            </div>', '', NULL, NULL),
(4, 'Large Purchase Invoice', 'receiving', 1, 'large', '<div class=\"invoice-page-wrapper\">\n                <div class=\"thermal-invoice\" style=\"width: 95mm;\">\n                    <!--Invoice Header-->\n                    <div class=\"text-center invoice-header mb-3\">\n                    \n                        <!--Invoice Logo-->\n                       <img src=\"{logo_source}\" width=\"100\" class=\"img-fluid\" alt=\"\">\n                        <div class=\"app-name my-2\">{app_name}</div>\n                        <div>\n                            <h6 class=\"text-uppercase font-weight-bold\">Purchase Invoice</h6>\n                        </div>\n                        <small class=\"font-weight-bold\">\n                            {date} - {time}\n                        </small>\n                    </div>\n    \n                    <!--Invoice Info-->\n                    <div class=\"mb-3 font-weight-bold invoice-info\">\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Invoice ID: </span> {invoice_id}\n                        </p>\n                         <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Supplier: </span> {supplier_name}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">TIN: </span> {tin}\n                        </p>\n                        <p class=\"mb-1\">\n                            <span class=\"font-weight-bold\">Purchased By: </span> {employee_name}\n                        </p>\n                    </div>\n    \n                    <!--Invoice Body-->\n                    <table class=\"table table-borderless\">\n                        <tbody class=\"font-weight-bold\">\n                            <tr class=\"border-top border-bottom t-header\">\n                                <th class=\"pl-0\">Items</th>\n                                <th class=\"text-right\">Qty</th>\n                                <th class=\"text-right\">Price</th>\n                                <th class=\"text-right\">Discount</th>\n                                <th class=\"text-right pr-0\">Total</th>\n                            </tr>\n                            <tr><td>{item_details}</td></tr>\n                            <tr class=\"t-footer border-top\">\n                                <td>Subtotal</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{sub_total}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td>Tax</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{tax}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td>Discount</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{discount}</td>\n                            </tr>\n                            <tr class=\"t-footer\">\n                                <td>Total</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{total}</td>\n                            </tr>\n                            <tr><td>{payment_details}</td></tr>\n                            <tr class=\"t-footer\">\n                                <td>Exchange</td>\n                                <td class=\"font-weight-bold\" colspan=\"4\">{exchange}</td>\n                            </tr>\n                        </tbody>\n                    </table>\n                    <div class=\"text-center\">{barcode}</div>\n                </div>\n            </div>', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_03_04_124154_create_settings_table', 1),
(4, '2018_03_05_134724_create_roles_table', 1),
(5, '2018_03_06_125804_create_email_templates_table', 1),
(6, '2018_03_11_081629_create_invites_table', 1),
(7, '2018_04_04_122419_create_notifications_table', 1),
(8, '2018_04_23_093600_create_product_categories_table', 1),
(9, '2018_04_23_094449_create_payment_types_table', 1),
(10, '2018_04_23_133454_create_customer_groups_table', 1),
(11, '2018_04_24_065209_create_product_brands_table', 1),
(12, '2018_04_24_074704_create_product_groups_table', 1),
(13, '2018_04_24_114457_create_products_table', 1),
(14, '2018_04_24_120528_create_product_variants_table', 1),
(15, '2018_04_24_123129_create_product_attributes_table', 1),
(16, '2018_04_25_063137_create_taxes_table', 1),
(17, '2018_04_25_113030_create_branches_table', 1),
(18, '2018_05_06_093016_create_product_attribute_values_table', 1),
(19, '2018_09_24_121807_create_orders_table', 1),
(20, '2018_09_24_122120_create_order_items_table', 1),
(21, '2018_09_24_122145_create_payments_table', 1),
(22, '2018_09_25_102442_create_cash_registers_table', 1),
(23, '2018_10_18_080804_create_cash_register_logs_table', 1),
(24, '2018_12_26_065902_create_product_units_table', 1),
(25, '2019_04_15_074946_create_customers_table', 1),
(26, '2019_04_15_080443_create_suppliers_table', 1),
(27, '2019_05_29_073208_create_shortcut_keys_table', 1),
(28, '2019_08_26_071749_invoice_template_table', 1),
(29, '2019_10_03_110011_create_restaurant_tables_table', 1),
(30, '2019_11_21_100102_create_adjust_product_stock_types_table', 1),
(31, '2019_11_26_072652_create_todo_lists_table', 1),
(32, '2019_12_26_082431_create_corn_job_logs_table', 1),
(33, '2020_02_17_071037_create_sms_templates_table', 1),
(34, '2020_03_09_122331_create_shipping_areas_table', 1),
(35, '2020_03_11_083720_create_shipping_information_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int UNSIGNED NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `booking_id` int NOT NULL,
  `booking_by` int NOT NULL,
  `notify_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `read_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `order_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sales_note` longtext COLLATE utf8_unicode_ci,
  `sub_total` double(20,2) NOT NULL,
  `total_tax` double(20,2) NOT NULL DEFAULT '0.00',
  `due_amount` double(20,2) NOT NULL DEFAULT '0.00',
  `total` double(20,2) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `profit` double(20,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `all_discount` double(20,2) NOT NULL DEFAULT '0.00',
  `customer_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `branch_id` int NOT NULL,
  `transfer_branch_id` int DEFAULT NULL,
  `table_id` int DEFAULT NULL,
  `created_by` int NOT NULL,
  `returned_invoice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `return_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `variant_id` int NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` double(8,2) NOT NULL,
  `price` double(20,2) NOT NULL,
  `discount` double(20,2) NOT NULL DEFAULT '0.00',
  `sub_total` double(20,2) NOT NULL DEFAULT '0.00',
  `tax_id` int DEFAULT NULL,
  `order_id` int NOT NULL,
  `adjust_stock_type_id` int NOT NULL DEFAULT '0',
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `paid` double(20,2) NOT NULL,
  `exchange` double(20,2) DEFAULT NULL,
  `payment_method` int NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_id` int NOT NULL,
  `cash_register_id` int DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE `payment_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_types`
--

INSERT INTO `payment_types` (`id`, `name`, `type`, `status`, `is_default`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'ເງິນໂອນ', 'cash', 'no_round', 1, 1, NULL, '2022-06-17 11:20:02'),
(2, 'ເງິນສົດ', 'credit', 'no_round', 0, 1, NULL, '2022-06-17 11:20:45');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `category_id` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `taxable` tinyint NOT NULL DEFAULT '0',
  `tax_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_id` tinyint(1) DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int DEFAULT NULL,
  `imageURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int NOT NULL,
  `attribute_id` int NOT NULL,
  `values` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_brands`
--

CREATE TABLE `product_brands` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_groups`
--

CREATE TABLE `product_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_units`
--

CREATE TABLE `product_units` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int UNSIGNED NOT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int NOT NULL,
  `variant_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute_values` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `variant_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_price` double(20,2) NOT NULL,
  `selling_price` double(20,2) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `isNotify` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imageURL` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no_image.png',
  `bar_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `re_order` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_tables`
--

CREATE TABLE `restaurant_tables` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch_id` int NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'available',
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `permissions`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Manager', 'a:22:{i:0;s:19:\"can_manage_products\";i:1;s:16:\"can_see_products\";i:2;s:21:\"can_manage_categories\";i:3;s:18:\"can_see_categories\";i:4;s:17:\"can_manage_brands\";i:5;s:14:\"can_see_brands\";i:6;s:17:\"can_manage_groups\";i:7;s:14:\"can_see_groups\";i:8;s:28:\"can_manage_variant_attribute\";i:9;s:25:\"can_see_variant_attribute\";i:10;s:16:\"can_manage_units\";i:11;s:13:\"can_see_units\";i:12;s:16:\"can_manage_sales\";i:13;s:17:\"can_add_suppliers\";i:14;s:17:\"can_see_suppliers\";i:15;s:24:\"can_see_supplier_details\";i:16;s:20:\"can_manage_customers\";i:17;s:17:\"can_see_customers\";i:18;s:26:\"can_manage_customer_groups\";i:19;s:23:\"can_see_customer_groups\";i:20;s:24:\"can_see_customer_details\";i:21;s:30:\"can_close_others_cash_register\";}', 1, '2022-06-17 11:03:23', '2022-06-17 11:03:23'),
(2, 'Sales', 'a:7:{i:0;s:16:\"can_manage_sales\";i:1;s:20:\"can_manage_customers\";i:2;s:17:\"can_see_customers\";i:3;s:26:\"can_manage_customer_groups\";i:4;s:23:\"can_see_customer_groups\";i:5;s:24:\"can_see_customer_details\";i:6;s:30:\"can_close_others_cash_register\";}', 1, '2022-06-17 11:05:51', '2022-06-17 11:05:51');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `setting_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `setting_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_name`, `setting_value`, `setting_type`, `user_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'time_format', '24h', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 13:09:57'),
(2, 'date_format', 'd.m.Y', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 13:09:57'),
(3, 'currency_symbol', '₭', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 13:09:57'),
(4, 'currency_format', 'right', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 13:09:57'),
(5, 'thousand_separator', 'space', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 13:09:57'),
(6, 'language_setting', 'lo', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 13:09:57'),
(7, 'decimal_separator', '.', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 13:09:57'),
(8, 'number_of_decimal', '3', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 13:09:57'),
(9, 'offday_setting', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'email_from_name', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'email_from_address', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'email_driver', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'email_smtp_host', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'email_port', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'email_smtp_password', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'email_encryption_type', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'mandrill_api', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'sparkpost_api', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'mailgun_domain', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'mailgun_api', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'max_row_per_table', '50', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 13:09:57'),
(22, 'app_name', 'Hmong POS', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 13:09:57'),
(23, 'app_logo', 'logo_3313384.png', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 13:09:57'),
(24, 'currency_code', 'usd', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'can_signup', '1', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'can_login', '1', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'invoice_prefix', 'Hmong POS', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 11:23:44'),
(28, 'invoice_suffix', '', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 11:23:44'),
(29, 'last_invoice_number', '2000', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 11:23:44'),
(30, 'auto_generate_invoice', '0', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 11:23:44'),
(31, 'auto_email_receive', '0', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 11:23:44'),
(32, 'invoice_starts_from', '2000', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 11:23:44'),
(33, 'invoiceLogo', 'default-logo.jpg', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'purchase_invoice_prefix', 'Hmong POS', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 11:23:55'),
(35, 'purchase_invoice_suffix', '', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 11:23:55'),
(36, 'purchase_last_invoice_number', '1000', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 11:23:55'),
(37, 'purchase_auto_generate_invoice', '0', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 11:23:55'),
(38, 'purchase_invoice_starts_from', '1000', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 11:23:55'),
(39, 'purchase_invoiceLogo', 'default-logo.jpg', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 're_order', '10', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'sku_prefix', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'sales_return_status', 'sales', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'purchase_return_status', 'purchase', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'offline_mode', '1', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 13:09:57'),
(45, 'time_zone', 'UTC', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 13:09:57'),
(46, 'notification_time', '2019-12-25T04:00:00.641Z', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'low_stock_notification', '1', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 11:28:47'),
(48, 'out_of_stock_products', '1', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 10:53:57'),
(49, 'sales_list_delete_option', '0', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 10:53:57'),
(50, 'sms_recive_to_customer', '0', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 10:53:57'),
(51, 'new_customer_welcome_sms', '0', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 10:53:57'),
(52, 'sms_from_name_phone_number', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'sms_driver', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'key', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'secret_key', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'sales_list_edit_option', '0', '', NULL, 0, '0000-00-00 00:00:00', '2022-06-17 10:53:57'),
(57, 'purchase_code', '', '', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'current_branch', '1', 'user', 1, 0, '2022-05-08 08:28:16', '2022-05-08 08:28:16');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_areas`
--

CREATE TABLE `shipping_areas` (
  `id` bigint UNSIGNED NOT NULL,
  `area` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shipping_areas`
--

INSERT INTO `shipping_areas` (`id`, `area`, `price`, `created_at`, `updated_at`) VALUES
(1, 'ອະນຸສິດ', 7000, '2022-06-17 04:15:03', '2022-06-17 04:15:03'),
(2, 'ຮຸ່ງອາລຸນ', 12000, '2022-06-17 04:15:36', '2022-06-17 04:15:36');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_information`
--

CREATE TABLE `shipping_information` (
  `id` bigint UNSIGNED NOT NULL,
  `shipping_area_id` int NOT NULL,
  `price` double NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` int NOT NULL,
  `branch_id` int NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shortcut_keys`
--

CREATE TABLE `shortcut_keys` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `defaultShortcuts` longtext COLLATE utf8_unicode_ci NOT NULL,
  `customShortcuts` longtext COLLATE utf8_unicode_ci,
  `created_by` int NOT NULL,
  `shortcutsStatus` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shortcut_keys`
--

INSERT INTO `shortcut_keys` (`id`, `user_id`, `defaultShortcuts`, `customShortcuts`, `created_by`, `shortcutsStatus`, `created_at`, `updated_at`) VALUES
(1, 1, 'a:7:{s:13:\"productSearch\";a:3:{s:11:\"action_name\";s:13:\"productSearch\";s:12:\"shortcut_key\";s:6:\"ctrl+s\";s:6:\"status\";b:1;}s:8:\"holdCard\";a:3:{s:11:\"action_name\";s:8:\"holdCard\";s:12:\"shortcut_key\";s:6:\"ctrl+h\";s:6:\"status\";b:1;}s:3:\"pay\";a:3:{s:11:\"action_name\";s:3:\"pay\";s:12:\"shortcut_key\";s:6:\"ctrl+p\";s:6:\"status\";b:1;}s:11:\"addCustomer\";a:3:{s:11:\"action_name\";s:11:\"addCustomer\";s:12:\"shortcut_key\";s:6:\"ctrl+a\";s:6:\"status\";b:1;}s:14:\"cancelCarditem\";a:3:{s:11:\"action_name\";s:14:\"cancelCarditem\";s:12:\"shortcut_key\";s:6:\"ctrl+d\";s:6:\"status\";b:1;}s:13:\"loadSalesPage\";a:3:{s:11:\"action_name\";s:13:\"loadSalesPage\";s:12:\"shortcut_key\";s:6:\"ctrl+l\";s:6:\"status\";b:1;}s:12:\"donePayment1\";a:3:{s:11:\"action_name\";s:12:\"donePayment1\";s:12:\"shortcut_key\";s:6:\"ctrl+m\";s:6:\"status\";b:1;}}', NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` int UNSIGNED NOT NULL,
  `template_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `template_type`, `template_subject`, `default_content`, `custom_content`, `created_at`, `updated_at`) VALUES
(1, 'pos_sms', 'Sales sms', 'Hi, {first_name} Thanks for shopping with {app_name}. Your invoice is {invoice_id} Total amount {total}', '', NULL, NULL),
(2, 'customer_welcome_sms', 'Customer Welcome sms', 'Hi, {first_name} Thanks for join with {app_name}', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tin_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percentage` double NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `percentage`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Zero Tax', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `todo_lists`
--

CREATE TABLE `todo_lists` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `due_date` date DEFAULT NULL,
  `completed_date` date DEFAULT NULL,
  `completed` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int NOT NULL DEFAULT '0',
  `user_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_excluded` tinyint NOT NULL DEFAULT '1',
  `enabled` tinyint NOT NULL DEFAULT '1',
  `created_by` int NOT NULL,
  `branch_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_check` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `gender`, `date_of_birth`, `company`, `phone_number`, `address`, `avatar`, `verified`, `is_admin`, `role_id`, `user_type`, `tax_excluded`, `enabled`, `created_by`, `branch_id`, `token`, `remember_token`, `notification_check`, `created_at`, `updated_at`) VALUES
(1, 'nujsua', 'hawj', 'nousainther@gmail.com', '$2y$10$VowRTYkPwlSLbOy.GU1u1uMCLgo94fMpbcwweXU3ovDF68qlO845G', 'Male', '2021-08-01', NULL, NULL, NULL, 'profile_55523228.jpeg', 1, 1, 0, 'staff', 1, 1, 0, '1', '', NULL, NULL, '0000-00-00 00:00:00', '2022-06-17 11:36:01'),
(2, 'Robert', 'Smith', 'robert@demo.com', '$2y$10$u9h1L.mRblhiaGGlN8F/2edbmxAFf3qdb80F0yGIn.BQ7aZIcCo/u', NULL, NULL, NULL, NULL, NULL, 'default.jpg', 1, 0, 2, 'staff', 1, 1, 0, '2', '', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Joan', 'Toy', 'joan@demo.com', '$2y$10$GLi5Nsc4MuSxEGjqZnjfVulk4GZVzrKOzgsIRlSEN9n52RgiRFOG.', NULL, NULL, NULL, '123456789', NULL, 'default.jpg', 1, 0, 2, 'staff', 1, 1, 0, '1', '', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Kade', 'Kiehn', 'kade@demo.com', '$2y$10$LqVYw2nEXTShu8UOPND9QOV8Vp7mXvyJ64a0QIIqXHZTnRyh5RcZi', NULL, NULL, NULL, '123456789', NULL, 'default.jpg', 1, 0, 1, 'staff', 1, 1, 0, '1', '', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Ali', 'Banet', 'banet@demo.com', '$2y$10$gdBiiHjTJOC94.Wnb95LReDr/8OwvFTIp3l3R9bA3yA/dofzCy8AC', NULL, NULL, 'Banet Multimedia', '1230456789', NULL, 'default.jpg', 1, 0, 1, 'staff', 1, 1, 0, '2', '', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjust_product_stock_types`
--
ALTER TABLE `adjust_product_stock_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_register_logs`
--
ALTER TABLE `cash_register_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `corn_job_logs`
--
ALTER TABLE `corn_job_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invites`
--
ALTER TABLE `invites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_templates`
--
ALTER TABLE `invoice_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_brands`
--
ALTER TABLE `product_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_groups`
--
ALTER TABLE `product_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_units`
--
ALTER TABLE `product_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_variants_sku_unique` (`sku`);

--
-- Indexes for table `restaurant_tables`
--
ALTER TABLE `restaurant_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_areas`
--
ALTER TABLE `shipping_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_information`
--
ALTER TABLE `shipping_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shortcut_keys`
--
ALTER TABLE `shortcut_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todo_lists`
--
ALTER TABLE `todo_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adjust_product_stock_types`
--
ALTER TABLE `adjust_product_stock_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cash_register_logs`
--
ALTER TABLE `cash_register_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `corn_job_logs`
--
ALTER TABLE `corn_job_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invites`
--
ALTER TABLE `invites`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_templates`
--
ALTER TABLE `invoice_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_brands`
--
ALTER TABLE `product_brands`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_groups`
--
ALTER TABLE `product_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_units`
--
ALTER TABLE `product_units`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_tables`
--
ALTER TABLE `restaurant_tables`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `shipping_areas`
--
ALTER TABLE `shipping_areas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_information`
--
ALTER TABLE `shipping_information`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shortcut_keys`
--
ALTER TABLE `shortcut_keys`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `todo_lists`
--
ALTER TABLE `todo_lists`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
